@echo off
pushd "%~dp0" 2>NUL
echo. [*] Updating prerequisites . . .
REM requires nodejs, yarn, nircmd, git?,
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
choco upgrade nircmd nodejs -y
call refreshenv
choco upgrade yarn -y
call refreshenv

REM INSTALL GITKRAKEN HERE?
REM https://release.gitkraken.com/win64/GitKrakenSetup.exe
REM GitKrakenSetup.exe --silent

cd GitCracken-main

REM PATCH WITH GITCRACKEN
REM allow self signed certificates at bae
REM https://stackoverflow.com/questions/40033794/yarn-unable-to-verify-the-first-certificate
REM cmd /c yarn config set "strict-ssl" false -g
cmd /c yarn install
cmd /c yarn build
cmd /c yarn run gitcracken patcher

REM DISABLE THE AUTO UPDATE EXECUTABLE
ren "%localappdata%\gitkraken\Update.exe" noupdate
ren "%localappdata%\gitkraken\%gitkrakenversion%\squirrel.exe" nosquirrel
rem squirrel seems to edit the config and remove pro from licensedFeatures (10.4.0)
ren "%localappdata%\gitkraken\gitkraken.exe" gitkraken.exe.bak
rem might not need to remove this one, but just in case

REM Find the latest GitKraken app version number
REM https://stackoverflow.com/questions/57066888/file-name-pattern-matching-in-windows-command-line
REM https://superuser.com/questions/570760/find-filenames-with-certain-pattern-on-windows-command-line
cd /d "%localappdata%\gitkraken"
for /F "delims= eol=|" %%f in ('
    dir /B /A:D "app*" ^| findstr "."
') do (
	set gitkrakenversion=%%f
)

REM CHANGE THE START MENU SHORTCUT SO IT NO LONGER POINTS TO UPDATE.EXE
echo.
echo. [*] Updating shortcuts . . .
@REM del "%appdata%\Microsoft\Windows\Start Menu\Programs\Axosoft, LLC\GitKraken.lnk" >nul 2>nul
del "%appdata%\Microsoft\Windows\Start Menu\Programs\GitKraken\GitKraken.lnk" >nul 2>nul
REM https://nircmd.nirsoft.net/shortcut.html
nircmd shortcut "%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe" "~$folder.programs$\GitKraken" "GitKraken"

REM CHANGE THE REGISTRY VALUES FOR THE RIGHT CLICK EXPLORER CONTEXT MENU
echo.
echo. [*] Updating right-click context menu . . .
reg add HKEY_CLASSES_ROOT\directory\background\shell\GitKraken\command /f /d "\"%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe\" -p \"%%V\""
reg add HKEY_CLASSES_ROOT\directory\shell\GitKraken\command /f /d "\"%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe\" -p \"%%1\""
REM use the following paths to revert context menu changes
REM "\"C:\\Users\\thomanoon.hongsmatip\\AppData\\Local\\gitkraken\\update.exe\" --processStart=gitkraken.exe --process-start-args=\"-p \\\"%V\\\"\""
REM "\"C:\\Users\\thomanoon.hongsmatip\\AppData\\Local\\gitkraken\\update.exe\" --processStart=gitkraken.exe --process-start-args=\"-p \\\"%1\\\"\""

echo.
echo. [!] Finished
pause
popd
@echo off
pushd "%~dp0" 2>NUL
REM requires nodejs, yarn, nircmd, git?,
REM choco upgrade nircmd -y
choco upgrade nodejs -y
cmd /c refreshenv
choco upgrade yarn
cmd /c refreshenv
REM pause
REM https://github.com/BoGnY/GitCracken

REM INSTALL

REM git clone maybe?

REM PATCH WITH GITCRACKEN
cd GitCracken-0.8
REM allow self signed certificates at bae
REM https://stackoverflow.com/questions/40033794/yarn-unable-to-verify-the-first-certificate
REM yarn config set "strict-ssl" false -g
cmd /c yarn install
cmd /c yarn build
cmd /c yarn run gitcracken patcher

REM DISABLE THE AUTO UPDATE EXECUTABLE
ren "%localappdata%\gitkraken\Update.exe" noupdate

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
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Axosoft, LLC\GitKraken.lnk"
REM https://nircmd.nirsoft.net/shortcut.html
nircmd shortcut "%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe" "~$folder.programs$\Axosoft, LLC" "GitKraken"

pause
popd
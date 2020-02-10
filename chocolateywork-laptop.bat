@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs

pushd %shortcutsfolder%
REM echo checking for updates . . .
REM choco outdated>C:\Users\thomanoon.hongsmatip\Desktop\Programs\temp.txt
REM type "temp.txt" | findstr /C:"Chocolatey has determined 0 package(s) are outdated">nul
REM if %errorlevel%==0 (
	REM echo chocolatey packages are up to date
	REM goto :anaconda_stuff
REM )

if not exist %shortcutsfolder% mkdir %shortcutsfolder%
if not exist %shortcutsfolder%\av mkdir %shortcutsfolder%\av
if not exist %shortcutsfolder%\hdd mkdir %shortcutsfolder%\hdd

choco upgrade chocolatey -y
choco upgrade chocolatey-core.extension -y

REM RUNTIMES
choco upgrade vcredist140 -y
choco upgrade dotnetfx -y

REM SYSTEM TOOLS
choco upgrade nircmd -y
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"

REM AV
REM choco upgrade malwarebytes --ignore-checksums -y
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av>nul
choco upgrade adwcleaner -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul

REM PRODUCTIVITY
REM choco upgrade qbittorrent -y
REM choco upgrade 7zip.install -y
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder% >nul
choco upgrade notepadplusplus.install -y
choco upgrade sumatrapdf.install -y
REM choco upgrade cutepdf --ignore-checksums -y
REM paint.net
REM choco install irfanview --params "/assoc=1" -y
REM choco upgrade vlc -y
REM move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul

REM DEV TOOLS
choco upgrade vscode -y
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul
choco upgrade sublimemerge -y
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
REM choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
REM choco upgrade anaconda3 --params "/AddToPath" -y

:anaconda_stuff
echo updating anaconda . . .
REM https://stackoverflow.com/questions/33699577/conda-update-failed-ssl-error-ssl-certificate-verify-failed-certificate-ver
REM cmd /c conda config --set ssl_verify false 
cmd /c conda update --all -y

pause
popd
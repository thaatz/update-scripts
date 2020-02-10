@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs

pushd %shortcutsfolder%

if not exist %shortcutsfolder% mkdir %shortcutsfolder%
if not exist %shortcutsfolder%\av mkdir %shortcutsfolder%\av
if not exist %shortcutsfolder%\hdd mkdir %shortcutsfolder%\hdd

choco upgrade chocolatey -y
REM choco upgrade chocolatey-core.extension -y

REM RUNTIMES
choco upgrade vcredist140 -y
choco upgrade dotnetfx -y

REM SYSTEM TOOLS
choco upgrade nircmd -y
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul
REM choco upgrade revo-uninstaller -y
REM choco upgrade speccy -y
REM move /y "%public%\Desktop\Speccy.lnk" %shortcutsfolder% >nul
REM choco upgrade winaero-tweaker -y
REM move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul
REM choco upgrade ddu -y
REM choco upgrade teracopy -y
REM choco upgrade lockhunter -y
REM choco upgrade autohotkey.install -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
REM choco upgrade qttabbar -y
REM choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
REM choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
REM nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"
REM choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
REM nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"

REM HDD TOOLS
REM choco upgrade backupper-standard --ignore-checksums -y
REM move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd >nul
REM choco upgrade partitionwizard -y
REM move /y "%public%\Desktop\MiniTool Partition Wizard.lnk" %shortcutsfolder%\hdd >nul
REM choco upgrade rufus -y
REM choco upgrade etcher -y
REM choco upgrade windows-iso-downloader --ignore-checksums -y
REM move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul
REM crystaldiskinfo

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av >nul
choco upgrade adwcleaner --ignore-checksums -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul

REM PRIVACY
choco upgrade pia -y
choco upgrade tor-browser -y
move /y "%public%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul
move /y "%userprofile%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul

REM PRODUCTIVITY
choco upgrade qbittorrent -y
choco upgrade 7zip.install -y
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder% >nul
choco upgrade notepadplusplus.install -y
choco upgrade sumatrapdf.install -y
choco upgrade cutepdf --ignore-checksums -y
REM paint.net
choco install irfanview --params "/assoc=1" -y
choco upgrade vlc -y
move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul

REM HTPC
choco upgrade sonarr -y
choco upgrade radarr -y
choco upgrade lidarr -y
choco upgrade jackett -y

REM DEV TOOLS
REM choco upgrade vscode -y
REM move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul
REM choco upgrade sublimemerge -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
REM choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
REM choco upgrade anaconda3 --params "/AddToPath" -y

REM echo updating anaconda . . .
REM cmd /c refreshenv
REM cmd /c conda update --all -y
REM python -m pip install --upgrade pip

pause
popd
@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetfx dotnet-desktopruntime
REM choco upgrade chocolatey-core.extension -y

REM SYSTEM TOOLS
choco upgrade nircmd -y
REM cmd /c refreshenv REM cmd environment doesnt actually need to be refreshed to call nircmd after install
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade revo-uninstaller -y
move /y "%public%\Desktop\Revo Uninstaller.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade speccy -y
REM move /y "%public%\Desktop\Speccy.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade winaero-tweaker -y
REM move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
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
REM move /y "%public%\Desktop\AOMEI Backupper.lnk" %shortcutsfolder%\hdd >nul 2>nul
REM choco upgrade partitionwizard -y
REM move /y "%public%\Desktop\MiniTool Partition Wizard.lnk" %shortcutsfolder%\hdd >nul 2>nul
REM choco upgrade rufus -y
REM choco upgrade etcher -y
REM choco upgrade windows-iso-downloader --ignore-checksums -y
REM move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade crystaldiskinfo.install -y
if errorlevel 1 (
    echo. [i] Upgrade failed. Process might be running. Attempting to terminate . . .
    taskkill /im diskinfo32.exe /f
    taskkill /im diskinfo64.exe /f
    choco upgrade crystaldiskinfo.install -y
    )
move /y "%userprofile%\Desktop\CrystalDiskInfo.lnk" %shortcutsfolder%\hdd >nul 2>nul

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av >nul 2>nul
choco upgrade adwcleaner --ignore-checksums -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRIVACY
choco upgrade pia -y
choco upgrade tor-browser -y
move /y "%public%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul 2>nul
move /y "%userprofile%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul 2>nul

REM PRODUCTIVITY
call common\commonproductivity.bat REM firefox, notepadplusplus, sumatrapdf, vlc
choco upgrade qbittorrent -y
choco upgrade 7zip.install -y
choco upgrade cutepdf --ignore-checksums -y
if errorlevel 1 (
    echo. [i] Upgrade failed. Attempting fallback . . .
    choco uninstall cutepdf -y
    choco upgrade cutepdf --ignore-checksums -y
    )
REM paint.net
choco upgrade irfanview --params "/assoc=1" -y

REM HTPC
choco upgrade sonarr -y
choco upgrade radarr -y
choco upgrade lidarr -y
choco upgrade jackett -y

REM DEV TOOLS
REM choco upgrade vscode -y
REM move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade sublimemerge -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
REM choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
REM choco upgrade anaconda3 --params "/AddToPath" -y
REM call refreshenv

REM echo updating anaconda . . .
REM cmd /c conda update --all -y
REM python -m pip install --upgrade pip

pause
popd
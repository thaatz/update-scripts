@echo off
pushd "%~dp0" 2>NUL
call common\_detectwinver.bat
call common\directorysetup.bat

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetfx dotnet-desktopruntime

REM SYSTEM TOOLS
choco upgrade nircmd -y
REM cmd /c refreshenv REM cmd environment doesnt actually need to be refreshed to call nircmd after install
choco upgrade revo-uninstaller -y
move /y "%public%\Desktop\Revo Uninstaller.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade speccy -y
move /y "%public%\Desktop\Speccy.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade ddu -y
choco upgrade teracopy -y
choco upgrade lockhunter -y
choco upgrade autohotkey.install -y
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"

REM WINDOWS 10 SPECIFIC
if %OSBuild% geq 22000 (
    choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
    choco upgrade qttabbar -y
)

REM HDD TOOLS
choco upgrade backupper-standard --ignore-checksums -y
move /y "%public%\Desktop\AOMEI Backupper.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade partitionwizard -y
move /y "%public%\Desktop\MiniTool Partition Wizard.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade rufus -y
choco upgrade etcher -y
move /y "%userprofile%\Desktop\balenaEtcher.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade windows-iso-downloader --ignore-checksums -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul 2>nul
call common\_crystaldiskinfo.bat

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av >nul 2>nul
choco upgrade adwcleaner --ignore-checksums -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRIVACY
@REM choco upgrade pia -y
choco upgrade tor-browser -y
move /y "%public%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul 2>nul
move /y "%userprofile%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade zerotier-one -y

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

REM DEV TOOLS
call common\commondevtools.bat REM vscode procexp windowsterminal miniconda
choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install

pause
popd
@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM choco upgrade chocolatey-core.extension -y

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetf

REM SYSTEM TOOLS
choco upgrade nircmd -y
REM cmd /c refreshenv REM cmd environment doesnt actually need to be refreshed to call nircmd after install
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade revo-uninstaller -y
move /y "%public%\Desktop\Revo Uninstaller.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade speccy -y
move /y "%public%\Desktop\Speccy.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade ddu -y
choco upgrade teracopy -y
choco upgrade lockhunter -y
REM choco upgrade shutup10 -y
choco upgrade autohotkey.install -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
choco upgrade qttabbar -y
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"

REM HDD TOOLS
choco upgrade backupper-standard --ignore-checksums -y
move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade partitionwizard -y
move /y "%public%\Desktop\MiniTool Partition Wizard.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade rufus -y
choco upgrade etcher -y
move /y "%userprofile%\Desktop\balenaEtcher.lnk" %shortcutsfolder%\hdd >nul 2>nul
choco upgrade windows-iso-downloader --ignore-checksums -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul 2>nul
REM crystaldiskinfo

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
REM paint.net
choco upgrade irfanview --params "/assoc=1" -y

REM DEV TOOLS
call common\commondevtools.bat REM vscode sublimemerge
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
choco upgrade anaconda3 --params "/AddToPath" -y
call refreshenv

:anaconda_stuff
echo updating anaconda . . .
cmd /c conda update --all -y
REM python -m pip install --upgrade pip

pause
popd
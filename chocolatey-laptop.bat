@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs

choco upgrade chocolatey -y

REM RUNTIMES
choco upgrade vcredist140 -y
choco upgrade dotnetfx -y

REM SYSTEM TOOLS
choco upgrade nircmd -y
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul
choco upgrade revo-uninstaller -y
choco upgrade speccy -y
move /y "%public%\Desktop\Speccy.lnk" %shortcutsfolder% >nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul
REM choco upgrade ddu -y
REM choco upgrade teracopy -y
REM choco upgrade lockhunter -y
REM choco upgrade shutup10 -y
REM nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"
choco upgrade autohotkey.install -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
choco upgrade qttabbar -y
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"

REM HDD TOOLS
choco upgrade backupper-standard --ignore-checksum -y
move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd >nul
choco upgrade partitionwizard -y
move /y "%public%\Desktop\MiniTool Partition Wizard.lnk" %shortcutsfolder%\hdd >nul
choco upgrade rufus -y
choco upgrade etcher -y
choco upgrade windows-iso-downloader -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul
REM crystaldiskinfo

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av >nul
choco upgrade adwcleaner --ignore-checksum -y
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
choco upgrade cutepdf -y
REM paint.net
choco install irfanview --params "/assoc=1" -y
choco upgrade vlc -y
move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul

REM DEV TOOLS
choco upgrade vscode -y
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul
choco upgrade sublimemerge -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
choco upgrade anaconda3 --params "/AddToPath" -y
REM cmd /c refreshenv
cmd /c conda update --all -y

pause
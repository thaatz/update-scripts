@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs

choco upgrade chocolatey -y

REM RUNTIMES
choco upgrade vcredist140 -y
choco upgrade dotnetfx -y

REM SYSTEM TOOLS
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder%>nul
choco upgrade backupper-standard --ignore-checksum -y
move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd>nul
choco upgrade partitionwizard -y
choco upgrade rufus -y
choco upgrade etcher -y
choco upgrade windows-iso-downloader -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd>nul
REM crystaldiskinfo
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder%>nul
choco upgrade revo-uninstaller -y

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av>nul
choco upgrade adwcleaner --ignore-checksum -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av>nul

REM PRIVACY
REM tor
REM pia

REM PRODUCTIVITY
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder%>nul
REM irfanview
choco upgrade notepadplusplus.install -y
REM paint.net
choco upgrade vlc -y
move /y "%public%\Desktop\VLC Media Player.lnk" %shortcutsfolder%>nul
REM 7zip
choco upgrade sumatrapdf.install -y

REM DEV TOOLS
choco upgrade vscode -y
choco upgrade sublimemerge -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
choco upgrade anaconda3 --params "/AddToPath" -y
REM cmd /c refreshenv
cmd /c conda update --all -y

pause
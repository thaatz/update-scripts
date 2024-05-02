@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetfx dotnet-desktopruntime

REM SYSTEM TOOLS
choco upgrade^
 nircmd^
 winaero-tweaker^
 shutup10^
 shexview.install^
 shmnview^
 caffeine^
 -y
rem removed
rem  ccleaner^

@REM ccleaner
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul 2>nul
@REM winaero-tweaker
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
@REM shutup10
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"
@REM shexview.install
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
@REM shmnview
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"
@REM caffeine
REM installs to C:\ProgramData\chocolatey\lib\caffeine
nircmd shortcut "%programdata%\chocolatey\lib\caffeine\caffeine64.exe" "%shortcutsfolder%" "caffeine64.exe - Shortcut"

REM AV
REM choco upgrade malwarebytes --ignore-checksums -y
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av >nul 2>nul
@REM choco pin remove -n=adwcleaner
@REM choco upgrade adwcleaner --ignore-checksums -y
@REM choco pin add -n=adwcleaner
@REM move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRODUCTIVITY
@REM call common\commonproductivity.bat REM firefox, notepadplusplus, sumatrapdf, vlc
choco upgrade notepadplusplus.install -y
@REM move /y "%userprofile%\Desktop\SumatraPDF.lnk" %shortcutsfolder% >nul 2>nul
REM move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade qbittorrent -y
REM choco upgrade 7zip.install -y
REM choco upgrade cutepdf --ignore-checksums -y
REM paint.net
REM choco upgrade irfanview --params "/assoc=1" -y

REM DEV TOOLS
@REM call common\commondevtools.bat REM vscode sublimemerge
choco upgrade vscode procexp -y
call common\_windowsterminal.bat
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
REM choco upgrade anaconda3 --params "/AddToPath" -y
REM call refreshenv

@REM choco upgrade all -y
REM using pin instead of upgrade all --except so that cup all can be invoked at any time without anything special

pause
popd
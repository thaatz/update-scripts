@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM RUNTIMES
REM call common\runtimes.bat REM chocolatey vcredist140 dotnetf
REM dont install vcredist140 dotnetf in this setup yet?

choco upgrade chocolatey -y

choco upgrade^
 nircmd^
 ccleaner^
 autohotkey.install^
 qttabbar^
 winaero-tweaker^
 shutup10^
 shexview.install^
 shmnview^
 -y

REM SYSTEM TOOLS
@REM nircmd -y
REM cmd /c refreshenv REM cmd environment doesnt actually need to be refreshed to call nircmd after install
@REM ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul 2>nul
@REM choco upgrade autohotkey.install -y
@REM choco upgrade qttabbar -y
@REM choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
@REM shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\OOSU10.exe" "%shortcutsfolder%" "OOSU10.exe - Shortcut"
@REM shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
@REM shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
nircmd shortcut "%programdata%\chocolatey\bin\shmnview.exe" "%shortcutsfolder%" "shmnview.exe - Shortcut"

REM AV
REM choco upgrade malwarebytes --ignore-checksums -y
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av >nul 2>nul
@REM choco pin remove -n=adwcleaner
@REM choco upgrade adwcleaner --ignore-checksums -y
@REM choco pin add -n=adwcleaner
@REM move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRIVACY
rem private internet access
REM choco upgrade pia -y
REM choco upgrade qbittorrent -y

REM PRODUCTIVITY
@REM call common\commonproductivity.bat REM firefox, notepadplusplus, sumatrapdf, vlc
choco upgrade notepadplusplus.install sumatrapdf.install -y
move /y "%userprofile%\Desktop\SumatraPDF.lnk" %shortcutsfolder% >nul 2>nul
REM move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade 7zip.install -y
REM choco upgrade paint.net -y
REM choco upgrade cutepdf --ignore-checksums -y
REM choco upgrade chrome -y
choco upgrade irfanview --params "/assoc=1" -y

REM DEV TOOLS
@REM call common\commondevtools.bat REM vscode sublimemerge
choco upgrade vscode -y
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul 2>nul
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade anaconda3 --params "/AddToPath" -y
REM call refreshenv

@REM choco upgrade all -y
REM using pin instead of upgrade all --except so that cup all can be invoked at any time without anything special

pause
popd
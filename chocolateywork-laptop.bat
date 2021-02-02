@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetf

REM SYSTEM TOOLS
choco upgrade^
 nircmd^
 ccleaner^
 winaero-tweaker^
 shutup10^
 shexview.install^
 shmnview^
 caffeine^
 -y

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
choco pin remove -n=adwcleaner
choco upgrade adwcleaner --ignore-checksums -y
choco pin add -n=adwcleaner
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRODUCTIVITY
call common\commonproductivity.bat REM firefox, notepadplusplus, sumatrapdf, vlc
REM choco upgrade qbittorrent -y
REM choco upgrade 7zip.install -y
REM choco upgrade cutepdf --ignore-checksums -y
REM paint.net
REM choco upgrade irfanview --params "/assoc=1" -y

REM DEV TOOLS
call common\commondevtools.bat REM vscode sublimemerge
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
REM choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
REM choco upgrade anaconda3 --params "/AddToPath" -y
REM call refreshenv

@REM choco upgrade all -y
REM using pin instead of upgrade all --except so that cup all can be invoked at any time without anything special

:anaconda_stuff
echo updating anaconda . . .
REM https://stackoverflow.com/questions/33699577/conda-update-failed-ssl-error-ssl-certificate-verify-failed-certificate-ver
REM cmd /c conda config --set ssl_verify false
cmd /c conda init
:: personal preference but i dont want to load the anaconda environment in every powershell window
cmd /c conda config --set auto_activate_base false
@REM https://stackoverflow.com/questions/45197777/how-do-i-update-anaconda
@REM https://docs.anaconda.com/anaconda/install/update-version/
cmd /c conda update conda
cmd /c conda update anaconda
:: for bleeding edge use --all. in my experience this has a tendency to break things though
:: https://www.anaconda.com/blog/keeping-anaconda-date
@REM cmd /c conda update --all -y

pause
popd
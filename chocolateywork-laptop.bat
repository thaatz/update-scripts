@echo off
pushd "%~dp0" 2>NUL

call common\directorysetup.bat

REM RUNTIMES
call common\runtimes.bat REM chocolatey vcredist140 dotnetf

REM SYSTEM TOOLS
choco upgrade nircmd -y
REM cmd /c refreshenv REM cmd environment doesnt actually need to be refreshed to call nircmd after install
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul 2>nul
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
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av >nul 2>nul
choco upgrade adwcleaner --ignore-checksums -y
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
REM cmd /c refreshenv

:anaconda_stuff
echo updating anaconda . . .
REM https://stackoverflow.com/questions/33699577/conda-update-failed-ssl-error-ssl-certificate-verify-failed-certificate-ver
REM cmd /c conda config --set ssl_verify false
REM cmd /c conda update anaconda -y REM fresh install from SCCM requires anaconda update
cmd /c conda update --all -y

pause
popd
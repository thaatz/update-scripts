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

choco pin remove -n=open-shell
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
choco pin add -n=open-shell

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
choco pin remove -n=adwcleaner
choco upgrade adwcleaner --ignore-checksums -y
choco pin add -n=adwcleaner
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul 2>nul

REM PRIVACY
rem private internet access
REM choco upgrade pia -y
REM choco upgrade qbittorrent -y

REM PRODUCTIVITY
call common\commonproductivity.bat REM firefox, notepadplusplus, sumatrapdf, vlc
REM choco upgrade 7zip.install -y
REM choco upgrade paint.net -y
REM choco upgrade cutepdf --ignore-checksums -y
REM choco upgrade chrome -y
choco upgrade irfanview --params "/assoc=1" -y

REM DEV TOOLS
call common\commondevtools.bat REM vscode sublimemerge
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade anaconda3 --params "/AddToPath" -y
REM call refreshenv

@REM choco upgrade all -y
REM using pin instead of upgrade all --except so that cup all can be invoked at any time without anything special

REM anaconda
:anaconda_stuff
REM cmd /c conda update anaconda -y REM fresh install from SCCM requires anaconda update
cmd /c conda update --all -y
REM cmd /c conda clean --all -y
REM pip-review --trusted-host pypi.org --trusted-host files.pythonhosted.org --local --auto

pause
popd
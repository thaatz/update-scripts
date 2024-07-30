choco upgrade^
 vscode^
 procexp^
 -y
rem removed sublimemerge
call common\_windowsterminal.bat
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration /DefaultBranchName:master" -y

@REM choco upgrade anaconda3 --params "/AddToPath" -y
REM i prefer miniconda to anaconda these days because the base install is cleaner
REM upgrading through choco results in multiple windows uninstall entries.
REM miniconda really only needs to be installed once. We can update the packages through conda.
choco install miniconda3 --params "/AddToPath:1" -y
choco pin add -n miniconda3
call refreshenv
cmd /c conda update conda -n base -y
@REM cmd /c conda init
REM python -m pip install --upgrade pip
:: personal preference but i dont want to load the anaconda environment in every powershell window
@REM cmd /c conda config --set auto_activate_base false

:_eof

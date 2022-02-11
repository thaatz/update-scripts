choco upgrade vscode sublimemerge -y
move /y "%public%\Desktop\Visual Studio Code.lnk" %shortcutsfolder% >nul 2>nul
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y

@REM choco upgrade anaconda3 --params "/AddToPath" -y
REM i prefer miniconda to anaconda these days because the base install is cleaner
REM upgrading through choco results in multiple windows uninstall entries.
REM miniconda really only needs to be installed once. We can update the packages through conda.
choco install miniconda3 --params "/AddToPath:1" -y
call refreshenv
cmd /c conda update conda -n base -y
@REM cmd /c conda init
REM python -m pip install --upgrade pip
:: personal preference but i dont want to load the anaconda environment in every powershell window
@REM cmd /c conda config --set auto_activate_base false

echo. [i] Detecting latest Anaconda release . . .
FOR /F "tokens=2 USEBACKQ" %%F IN (`conda search anaconda`) DO (
    SET anaconda_online=%%F
)
echo.     %anaconda_online%

call activate latest
if %ERRORLEVEL%==1 (
    echo. [i] Conda environment "latest" is not set up yet . . .
    goto :UpgradeAnacondaPrompt
) else (
    call conda deactivate
    goto :CompareVersions
)

:CompareVersions
REM we need to break this out because batch files cant use nested if statements
echo. [i] Detecting installed version . . .
    FOR /F "tokens=2 USEBACKQ" %%F IN (`conda list --full-name anaconda -n latest`) DO (
        SET anaconda_local=%%F
    )
REM if the package is not installed, then this variable will be "Name"
if %anaconda_local%==Name set anaconda_local=Nothing
echo.     %anaconda_local%
if NOT %anaconda_local%==%anaconda_online% (
    echo.
    echo. [i] Found a different version of Anaconda. %anaconda_local% --^> %anaconda_online%
    goto :UpgradeAnacondaPrompt
) else (
    goto :_eof
)

:UpgradeAnacondaPrompt
echo.
set /p exs=Want to update Anaconda package?([Y]es/[N]o): 
if /i "%exs%"=="y" goto :UpgradeAnaconda
if /i "%exs%"=="n" goto :_eof
goto :UpgradeAnacondaPrompt

:UpgradeAnaconda
REM https://stackoverflow.com/questions/45197777/how-do-i-update-anaconda
REM https://docs.anaconda.com/anaconda/install/update-version/
cmd /c conda create -n latest
@REM call activate latest
REM conda search anaconda will output three columns, the second one being the pinned version, so we use tokens=2 to just take that column
cmd /c conda install anaconda=%anaconda_online% -n latest
:: for bleeding edge use --all. in my experience this has a tendency to break things though
:: https://www.anaconda.com/blog/keeping-anaconda-date
@REM cmd /c conda update --all -y
@REM call conda deactivate

:_eof

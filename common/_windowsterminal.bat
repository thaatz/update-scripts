
choco upgrade microsoft-windows-terminal -y
if errorlevel 1 (
    echo.
    echo. [i] Install failed. Dependencies might be missing. Installing VCLibs . . .
    goto :installvclibs
    ) else goto :nextthing

rem this needs to be broken out because cmd cant do nest if statements
rem https://github.com/microsoft/terminal/issues/3097
rem https://github.com/mkevenaar/chocolatey-packages/issues/124
:installvclibs
rem use backslash to escape double quotes https://superuser.com/questions/1080239/run-powershell-command-from-cmd
powershell -command "Invoke-WebRequest -Uri \"https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx\" -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx"
powershell -command "Add-AppxPackage -Path .\Microsoft.VCLibs.x64.14.00.Desktop.appx"
choco upgrade microsoft-windows-terminal -y

:nextthing


choco upgrade crystaldiskinfo.install -y
if errorlevel 1 (
    echo.
    echo. [i] Upgrade failed. Process might be running. Attempting to terminate . . .
    goto :crystaldiskinforetry
    ) else goto :nextthing

rem this needs to be broken out because cmd cant do nest if statements
:crystaldiskinforetry
taskkill /im diskinfo32.exe /f
if errorlevel 0 set diskinfover=32
taskkill /im diskinfo64.exe /f
if errorlevel 0 set diskinfover=64
choco upgrade crystaldiskinfo.install -y
echo. [i] Restarting CrystalDiskInfo . . .
start "" "%programfiles%\CrystalDiskInfo\DiskInfo%diskinfover%.exe"

:nextthing
move /y "%userprofile%\Desktop\CrystalDiskInfo.lnk" %shortcutsfolder%\hdd >nul 2>nul
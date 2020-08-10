set shortcutsfolder=%userprofile%\Desktop\Programs

if not exist %shortcutsfolder% mkdir %shortcutsfolder%
if not exist %shortcutsfolder%\av mkdir %shortcutsfolder%\av
if not exist %shortcutsfolder%\hdd mkdir %shortcutsfolder%\hdd

REM pushd %shortcutsfolder%
REM echo checking for updates . . .
REM choco outdated>temp.txt
REM type "temp.txt" | findstr /C:"Chocolatey has determined 0 package(s) are outdated">nul
REM if %errorlevel%==0 (
	REM echo chocolatey packages are up to date
	REM goto :anaconda_stuff
REM )
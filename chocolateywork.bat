@echo off
REM set shortcutsfolder=%~dp0
set shortcutsfolder=%userprofile%\Desktop\Programs

REM pushd %shortcutsfolder%
REM echo checking for updates . . .
REM choco outdated>C:\Users\thomanoon.hongsmatip\Desktop\Programs\temp.txt
REM type "temp.txt" | findstr /C:"Chocolatey has determined 0 package(s) are outdated">nul
REM if %errorlevel%==0 (
	REM echo chocolatey packages are up to date
	REM goto :anaconda_stuff
REM )

choco upgrade chocolatey -y
choco upgrade chocolatey-core.extension -y

REM RUNTIMES
REM choco upgrade dotnetfx -y
REM choco upgrade vcredist140 -y

REM SYSTEM TOOLS
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul
choco upgrade autohotkey.install -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
choco upgrade qttabbar -y
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin

REM AV
REM choco upgrade malwarebytes --ignore-checksums -y
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av >nul
choco upgrade adwcleaner -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul

REM PRIVACY
rem private internet access
REM choco upgrade pia -y
REM choco upgrade qbittorrent -y

REM PRODUCTIVITY
REM choco upgrade paint.net -y
choco upgrade sumatrapdf.install -y
REM choco upgrade cutepdf -y
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder% >nul
REM choco upgrade chrome -y
REM choco upgrade vlc -y
REM move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder%>nul
choco install irfanview --params "/assoc=1" -y

REM DEV TOOLS
choco upgrade notepadplusplus.install -y
choco upgrade vscode -y
choco upgrade sublimemerge -y
REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade anaconda3 --params "/AddToPath" -y

REM anaconda
:anaconda_stuff
cmd /c conda update --all -y
REM cmd /c conda clean --all -y
REM pip-review --trusted-host pypi.org --trusted-host files.pythonhosted.org --local --auto

pause
popd
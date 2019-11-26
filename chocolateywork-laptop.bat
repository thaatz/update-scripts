@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs

pushd %shortcutsfolder%
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
choco upgrade vcredist140 -y
choco upgrade dotnetfx -y

REM SYSTEM TOOLS
choco upgrade ccleaner -y
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder%>nul
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder%>nul
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin

REM AV
REM choco upgrade malwarebytes --ignore-checksums -y
REM move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%av>nul
choco upgrade adwcleaner -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%av>nul

REM PRODUCTIVITY
choco upgrade notepadplusplus.install -y
REM move /y "%public%\Desktop\Notepad++.lnk" %shortcutsfolder%
choco upgrade sumatrapdf.install -y

REM DEV TOOLS
choco upgrade vscode -y
choco upgrade sublimemerge -y
REM choco upgrade git -y

:anaconda_stuff
REM https://stackoverflow.com/questions/33699577/conda-update-failed-ssl-error-ssl-certificate-verify-failed-certificate-ver
REM cmd /c conda config --set ssl_verify false 
cmd /c conda update --all -y

pause
popd
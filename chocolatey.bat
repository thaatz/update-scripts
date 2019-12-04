@echo off
set shortcutsfolder=%userprofile%\Desktop\Programs
set CheckForUpdatesFirst=True
REM set CheckForUpdatesFirst to true to have this check for updates before running everything. This can slightly speed things up if there are no chocolatey updates needed
REM you must set this to false

pushd %shortcutsfolder%
REM echo checking for updates . . .
REM choco outdated>temp.txt
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
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder% >nul
choco upgrade revo-uninstaller -y
choco upgrade speccy -y
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder% >nul
choco upgrade ddu -y
choco upgrade teracopy -y
choco upgrade lockhunter -y
REM choco upgrade shutup10 -y
choco upgrade autohotkey.install -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y
choco upgrade qttabbar -y
choco upgrade shexview.install -y
REM installs to C:\Program Files (x86)\NirSoft\ShellExView
choco upgrade shmnview -y
REM installs to C:\ProgramData\chocolatey\bin
choco upgrade shutup10 -y
REM installs to C:\ProgramData\chocolatey\bin

REM HDD TOOLS
choco upgrade backupper-standard --ignore-checksums -y
move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd >nul
choco upgrade partitionwizard -y
choco upgrade rufus -y
choco upgrade etcher -y
choco upgrade windows-iso-downloader -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd >nul
REM crystaldiskinfo

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av >nul
choco upgrade adwcleaner --ignore-checksums -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av >nul

REM PRIVACY
choco upgrade pia -y
choco upgrade tor-browser -y
move /y "%public%\Desktop\Tor Browser.lnk" %shortcutsfolder% >nul

REM PRODUCTIVITY
choco upgrade qbittorrent -y
choco upgrade 7zip.install -y
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder% >nul
choco upgrade notepadplusplus.install -y
choco upgrade sumatrapdf.install -y
choco upgrade cutepdf -y
REM paint.net
choco install irfanview --params "/assoc=1" -y
choco upgrade vlc -y
move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul

REM DEV TOOLS
choco upgrade vscode -y
choco upgrade sublimemerge -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
REM choco upgrade python -y
choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM virutal box guest additions are only for INSIDE a windows VM guest
REM choco upgrade virtualbox-guest-additions-guest.install
choco upgrade anaconda3 --params "/AddToPath" -y

:anaconda_stuff
echo updating anaconda . . .
REM cmd /c refreshenv
cmd /c conda update --all -y
REM python -m pip install --upgrade pip

pause
popd
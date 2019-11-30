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
move /y "%public%\Desktop\CCleaner.lnk" %shortcutsfolder%
choco upgrade speccy -y
choco upgrade revo-uninstaller -y
REM choco upgrade malwarebytes -y
choco upgrade backupper-standard --ignore-checksums -y
move /y "%public%\Desktop\AOMEI Backupper Standard.lnk" %shortcutsfolder%\hdd
choco upgrade partitionwizard -y
choco upgrade rufus -y
choco upgrade windows-iso-downloader -y
move /y "%public%\Desktop\Microsoft Windows and Office ISO Download Tool.lnk" %shortcutsfolder%\hdd
choco upgrade winaero-tweaker -y
move /y "%public%\Desktop\Winaero Tweaker.lnk" %shortcutsfolder%
choco upgrade ddu -y
choco upgrade teracopy -y
choco upgrade lockhunter -y
REM choco upgrade shutup10 -y
choco upgrade open-shell -installArgs ADDLOCAL=StartMenu -y

REM AV
choco upgrade malwarebytes --ignore-checksums -y
move /y "%public%\Desktop\Malwarebytes.lnk" %shortcutsfolder%\av>nul
choco upgrade adwcleaner --ignore-checksums -y
move /y "%public%\Desktop\AdwCleaner.lnk" %shortcutsfolder%\av>nul

REM PRIVACY
choco upgrade pia -y
choco upgrade tor-browser -y
move /y "%public%\Desktop\Tor Browser.lnk" %shortcutsfolder%

REM PRODUCTIVITY
choco upgrade 7zip.install -y
choco upgrade qbittorrent -y
choco upgrade firefox -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder%
choco upgrade notepadplusplus.install -y
REM paint.net
choco install irfanview --params "/assoc=1" -y
choco upgrade vlc -y
move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder%

REM DEV TOOLS
choco upgrade vscode -y
choco upgrade sublimemerge -y
REM choco upgrade python -y
choco upgrade anaconda3 --params "/AddToPath" -y
choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
choco upgrade virtualbox --params "/NoDesktopShortcut /ExtensionPack" -y
REM choco upgrade virtualbox-guest-additions-guest.install

:anaconda_stuff
echo updating anaconda . . .
REM cmd /c refreshenv
cmd /c conda update --all -y
REM python -m pip install --upgrade pip

pause
popd
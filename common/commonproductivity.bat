REM unpin
choco pin remove -n firefox >nul
choco pin remove -n sumatrapdf.install >nul
choco pin remove -n vlc >nul

choco upgrade firefox notepadplusplus.install sumatrapdf.install vlc -y
move /y "%public%\Desktop\Firefox.lnk" %shortcutsfolder% >nul 2>nul
move /y "%userprofile%\Desktop\SumatraPDF.lnk" %shortcutsfolder% >nul 2>nul
move /y "%public%\Desktop\VLC media player.lnk" %shortcutsfolder% >nul 2>nul

REM pin
REM we only need to pin if there is additional custom install stuff, so for example, with notepadplusplus it does not matter
choco pin add -n firefox >nul
choco pin add -n sumatrapdf.install >nul
choco pin add -n vlc >nul
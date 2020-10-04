# use `chmod +x gitkrakenpatcher.sh`

# Detect Linux or Mac
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
if [ "$(uname)" == "Darwin" ]; then
	machine=Mac
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	machine=Linux
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	machine=Win32
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	machine=Win64
fi

echo ""
echo " [*] Updating prerequisites . . ."
# REM requires nodejs, yarn, nircmd, git?,
# REM choco upgrade git.install --params "/WindowsTerminal /NoShellIntegration" -y
# choco upgrade nircmd nodejs -y
# call refreshenv
# choco upgrade yarn -y
# call refreshenv

# INSTALL NODE.JS
if [ $machine == "Linux" ]; then
	sudo apt update
	sudo apt install nodejs
	# https://unix.stackexchange.com/questions/26695/refresh-env-variables-after-editing-bashrc-file
	source ~/.bashrc
elif [ $machine == "Mac" ]; then
	brew update
	brew install node
fi

# INSTALL YARN
if [ $machine == "Linux" ]; then
	# https://medium.com/@chillypenguin/chromebook-linux-apps-for-web-developers-902186f49b60
	# https://classic.yarnpkg.com/en/docs/install/#debian-stable
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update && sudo apt install yarn
	source ~/.bashrc
elif [ $machine == "Mac" ]; then
	brew install yarn
fi

# REM INSTALL GITKRAKEN HERE?
# https://support.gitkraken.com/how-to-install/
# wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
# sudo dpkg -i gitkraken-amd64.deb
# this would only work for updates. if initial install gitkraken must be run at least once

# https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
# REM or https://github.com/BoGnY/GitCracken
if [ -d "GitCracken/" ] 
then
	cd GitCracken/GitCracken
	git pull
else
	git clone https://github.com/5cr1pt/GitCracken
	cd GitCracken/GitCracken
fi

# REM PATCH WITH GITCRACKEN
# REM cd GitCracken-0.8
if [ $machine == "Linux" ]; then
	bash -c yarn install
	bash -c yarn build
	bash -c yarn run gitcracken patcher
elif [ $machine == "Mac" ]; then
	yarn install
	yarn build
	yarn run gitcracken patcher
fi

# I dont think the linux version has an auto updater so maybe dont need to worry about this stuff
# REM DISABLE THE AUTO UPDATE EXECUTABLE
# ren "%localappdata%\gitkraken\Update.exe" noupdate

# REM Find the latest GitKraken app version number
# REM https://stackoverflow.com/questions/57066888/file-name-pattern-matching-in-windows-command-line
# REM https://superuser.com/questions/570760/find-filenames-with-certain-pattern-on-windows-command-line
# cd /d "%localappdata%\gitkraken"
# for /F "delims= eol=|" %%f in ('
#     dir /B /A:D "app*" ^| findstr "."
# ') do (
# 	set gitkrakenversion=%%f
# )

# REM CHANGE THE START MENU SHORTCUT SO IT NO LONGER POINTS TO UPDATE.EXE
# echo.
# echo. [*] Updating shortcuts . . .
# del "%appdata%\Microsoft\Windows\Start Menu\Programs\Axosoft, LLC\GitKraken.lnk" >nul 2>nul
# REM https://nircmd.nirsoft.net/shortcut.html
# nircmd shortcut "%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe" "~$folder.programs$\Axosoft, LLC" "GitKraken"

# REM CHANGE THE REGISTRY VALUES FOR THE RIGHT CLICK EXPLORER CONTEXT MENU
# echo.
# echo. [*] Updating right-click context menu . . .
# reg add HKEY_CLASSES_ROOT\directory\background\shell\GitKraken\command /f /d "\"%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe\" -p \"%%V\""
# reg add HKEY_CLASSES_ROOT\directory\shell\GitKraken\command /f /d "\"%localappdata%\gitkraken\%gitkrakenversion%\gitkraken.exe\" -p \"%%1\""
# REM use the following paths to revert context menu changes
# REM "\"C:\\Users\\thomanoon.hongsmatip\\AppData\\Local\\gitkraken\\update.exe\" --processStart=gitkraken.exe --process-start-args=\"-p \\\"%V\\\"\""
# REM "\"C:\\Users\\thomanoon.hongsmatip\\AppData\\Local\\gitkraken\\update.exe\" --processStart=gitkraken.exe --process-start-args=\"-p \\\"%1\\\"\""

echo ""
echo " [!] Finished"
# https://www.cyberciti.biz/tips/linux-unix-pause-command.html
read -p "Press any key to continue . . ."
# popd
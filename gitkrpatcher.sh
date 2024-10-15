# use `chmod +x gitkrakenpatcher.sh`
# or try `chmod 755 ./gitkrakenpatcher.sh` for mac

# ADDITIONAL STEPS FOR MAC
# install homebrew https://brew.sh/
# `sudo nano /etc/hosts`
# 127.0.0.1 release.axocdn.com
# try
# echo "127.0.0.1 release.axocdn.com" | sudo tee --append /etc/hosts
# maybe https://gist.github.com/asimzeeshan/a813766d627684a5cd56421ba6aace99
# https://gist.github.com/ryanmaclean/107cb7b7105fd20d2e87

# maybe some extra things to add for linux
# (delete yarn stuff, install from tar, more specific way to run patcher)
# https://github.com/5cr1pt/GitCracken/issues/23

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

cd GitCracken-main

# REM PATCH WITH GITCRACKEN
if [ $machine == "Linux" ]; then
	bash -c yarn install
	bash -c yarn build
	bash -c yarn run gitcracken patcher
elif [ $machine == "Mac" ]; then
	yarn install
	yarn build
	yarn run gitcracken patcher
fi

# DISABLE AUTO UPDATE
# I dont think the linux version has an auto updater so maybe dont need to worry about this stuff?
# https://gist.github.com/asimzeeshan/a813766d627684a5cd56421ba6aace99
if [ $machine == "Mac" ]; then
	ETC_HOSTS=/etc/hosts
	IP="127.0.0.1"
	HOSTNAME=release.gitkraken.com
	# release.gitkraken.com redirects to release.axocdn.com, but if you just block release.gitkraken.com, it will make it so that auto update does not work but you will still be able to download from release.axocdn.com manually instead if you want
	HOSTS_LINE="$IP\t$HOSTNAME"
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
        then
            echo "$HOSTNAME already exists : $(grep $HOSTNAME $ETC_HOSTS)"
        else
            echo "Adding $HOSTNAME to your $ETC_HOSTS";
			# echo "127.0.0.1 release.axocdn.com" | sudo tee --append /etc/hosts
			echo "$HOSTS_LINE" | sudo tee -a /etc/hosts

            if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
                then
                    echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME /etc/hosts)";
                else
                    echo "Failed to Add $HOSTNAME, Try again!";
            fi
    fi
fi

echo ""
echo " [!] Finished"
# https://www.cyberciti.biz/tips/linux-unix-pause-command.html
read -p "Press any key to continue . . ."
# popd
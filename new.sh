#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {

		sudo add-apt-repository ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 c++-4.7
		sudo apt-get update		
                sudo apt-get upgrade
		sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
		sudo apt-get install lua-lgi
		sudo apt-get install libnotify-dev
		sudo apt-get install screen
		sudo apt-get install tmux
		wget https://valtman.name/files/telegram-cli-1222
		mv telegram-cli-1222 telegram
		chmod +x telegram
}
update() {
  git pull
  git submodule update --init --recursive
}
function print_logo() {
	echo -e "\033[38;5;605m"
	echo -e "            _____         _____ _____    _    __  __             "
	echo -e "           |  ___|____  _|_   _| ____|  / \  |  \/  |            "
	echo -e "           | |_ / _ \ \/ / | | |  _|   / _ \ | |\/| |            "
	echo -e "           |  _| (_) >  <  | | | |___ / ___ \| |  | |            "
  echo -e "           |_|  \___/_/\_\ |_| |_____/_/   \_\_|  |_|            \e[36m"
}
function logo_play() {
    declare -A txtlogo
    seconds="0.015"

txtlogo[1]="                    We are FoxTeams.                           "
txtlogo[2]="                    We are Legion.                             "
txtlogo[3]="                    We do not forgive.                         "
txtlogo[4]="                    We do not forget.                          "
txtlogo[5]="                    Expect us.                                 "
txtlogo[6]="                    Follow Team In TeleGram Channel : @FoxTeam."
   echo -e "\033[0;00m"
   echo -e "\e[36m"

    printf "\033[38;5;650m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
}


if [ "$1" = "install" ]; then
  install
elif [ "$1" = "update" ]; then
  update
else
if [ ! -f ./telegram ]; then
    echo "telegram not found"
    echo "Run $0 install"
    exit 1
 fi


 
   echo -e "\033[38;5;130m"
   logo_play
   echo -e "   _____    _        ____  _____ _____  _      "
   echo -e "  |_   _|__| | ___  | __ )| ____|_   _|/ \     "
   echo -e "    | |/ _ \ |/ _ \ |  _ \|  _|   | | / _ \    "
   echo -e "    | |  __/ |  __/ | |_) | |___  | |/ ___ \   "
   echo -e "    |_|\___|_|\___| |____/|_____| |_/_/   \_\  "
   echo -e "\e[36m"

   ./telegram -s ./bot/bot.lua -p beta-self-bot # Profile of Beyond Self Bot (Need Relogin)
fi
		

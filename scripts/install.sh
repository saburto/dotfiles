#!/bin/bash

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "⏰️ Installing: ${1}..." 
    sudo apt install -y $1
  else
    echo "✅️ Already installed: ${1}"
  fi
}

# Basic

install curl
install git
install vim
install vim-gtk
install file
install htop
install tree
install wget
install htop
install apt-transport-https 
install ca-certificates
install curl
install gnupg-agent
install software-properties-common
install tmux
install zsh
install autojump
install direnv
install xclip
install silversearcher-ag
install fonts-powerline
install build-essential

# Fun stuff
install figlet
install lolcat


# Run all scripts in programs/
for f in $HOME/.dotfiles/scripts/programs/*.sh
do
	echo "Installing: $f" 
	bash "$f" -H
done

echo "Installing sdks"
bash $HOME/.dotfiles/scripts/install-sdks.sh -H


# Fun hello
figlet "Done!" | lolcat

#!/bin/bash

echo "😎️ installing oh my zsh"

if [ -d "$HOME/.oh-my-zsh" ]
then
    echo "😎️ oh my zsh already installed!!"
    exit
fi

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc


echo "Installing spaceship-prompt"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1

ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme" 


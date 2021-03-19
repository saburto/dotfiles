# dotfiles
My personal dotfiles, (zsh, vim, tmux, etc..)

# Install in Ubunutu

First add ssh key to github https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Install the basic stuff:

```
sudo apt install git make
```

Then clone the repo this way:

```
git clone git@github.com:saburto/dotfiles.git .dotfiles
```

First run copy-dotfiles

```

cd .dotfiles
make copy-dotfiles

```

Then install all other deps
```
cd ~
make install
```

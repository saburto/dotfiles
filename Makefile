.DEFAULT_GOAL := help

.PHONY: help


help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


update: ## Do apt upgrade and autoremove
	sudo apt update && sudo apt upgrade -y
	sudo apt autoremove -y

install-rcm: ## Install RCM to copy the dotfiles
	sudo apt install rcm

copy-dotfiles: install-rcm ## Copy dotfiles to $HOME folder
	rcup -U Makefile -U README.md -U scripts


install: ## Install all software from scripts/install.sh
	$$HOME/.dotfiles/scripts/install.sh

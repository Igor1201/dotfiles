#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function customDoIt() {
	git config --global user.email "igor@borges.me"
	git config --global user.name "Igor Borges"
	git config --global user.signingkey "7AD24624"
	git config --global core.excludesfile "~/.gitignore"

	mkdir -p "$HOME/.oh-my-zsh/themes"
  cp "igor.zsh-theme" "$HOME/.oh-my-zsh/themes/"

	cp -R "sublime/" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
}

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "igor.zsh-theme" \
		--exclude "brew.sh" \
		-avh --no-perms . ~;

	customDoIt;

	source ~/.zprofile;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
unset customDoIt;

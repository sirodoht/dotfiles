#!/usr/bin/env bash

function copyDotfiles() {
    cp ~/.aliases .;
    cp ~/.bash_profile .;
    cp ~/.bash_prompt .;
    cp ~/.bashrc .;
    cp ~/.exports .;
    cp ~/.extra .;
    cp ~/.functions .;
    cp ~/.gitconfig .;
    cp ~/.gitignore .;
    cp ~/.inputrc .;
    cp ~/.npmrc .;
    cp ~/.vimrc .;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	copyDotfiles;
else
	read -p "This script copies dotfiles from ~ to the repo directory (pwd) in order to git diff changes. Do you want to continue? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		copyDotfiles;
	fi;
fi;
unset copyDotfiles;

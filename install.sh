#!/usr/bin/env bash

function syncDotfiles() {
	rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "install.sh" \
        --exclude "diff.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncDotfiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncDotfiles;
	fi;
fi;
unset syncDotfiles;

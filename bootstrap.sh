#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")" || exit 1

branch=$(git symbolic-ref --quiet --short HEAD 2> /dev/null || echo master)
git pull --ff-only origin "$branch"

doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "install-brew-and-packages.sh" \
		-avh --no-perms . ~
	source ~/.bash_profile
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

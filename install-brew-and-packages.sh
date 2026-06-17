#!/usr/bin/env bash

set -e

if ! command -v brew > /dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
	eval "$(/usr/local/bin/brew shellenv)"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if ! command -v brew > /dev/null 2>&1; then
	echo "Homebrew is installed, but brew is not available on PATH." >&2
	exit 1
fi

packages=(
	bash
	bash-completion
	wget
	tmux
	python
	htop
	git
	git-lfs
	fzf
)

# Install selected command-line tools using Homebrew.
brew update
brew upgrade

for package in "${packages[@]}"; do
	brew install "$package"
done

brew cleanup

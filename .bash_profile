#!/usr/bin/env bash

for file in ~/.{bash_prompt,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it.
shopt -s histappend

# Add tab completion for Bash commands when available.
if command -v brew > /dev/null 2>&1 && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`.
if type _git > /dev/null 2>&1 && [ -f "$(brew --prefix 2> /dev/null)/etc/bash_completion.d/git-completion.bash" ]; then
	complete -o default -o nospace -F _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards.
if [ -e "$HOME/.ssh/config" ]; then
	complete -o "default" -o "nospace" -W "$(grep "^Host" "$HOME/.ssh/config" | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh
fi

# Add tab completion for `defaults read|write NSGlobalDomain`.
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps.
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# Default file permission: -rw-r--r--
umask 022

#!/usr/bin/env bash

# macOS `ls` color options
colorflag="-G"
export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
# Always use color output for `ls`
alias ls="command ls ${colorflag}"
# Always enable colored `grep` output
alias grep='grep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Flush Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Reset LaunchPad
alias resetlaunchpad="defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Edit system files and dotfiles
alias viprofile="vim ~/.bash_profile"
alias vialias="vim ~/.bash_aliases"
alias vihost="sudo vim /etc/hosts"

# Count lines in git repo
alias gitlines="git ls-files | xargs wc -l"

# Copy SSH key
alias cpssh="cat ~/.ssh/id_ed25519.pub | pbcopy"

# Load ssh-agent
alias loadkey='eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519'

# Generate passwords
alias gen='echo $(pwgen -s 6 1)\$-$(pwgen -s 6 1)-\$$(pwgen -s 2 1)-$(pwgen -s 6 1)'

#!/usr/bin/env bash

# Shortcuts
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias p="cd ~/src"
alias docs="cd ~/Documents"

# macOS `ls` color options
colorflag="-G"
export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'

# List all files colorized in long format
alias l="ls -lFh ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -laFh ${colorflag}"

# List only directories
alias lsd="ls -lFh ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Flush Directory Service cache
alias flush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

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

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Reset LaunchPad
alias resetlaunchpad="defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

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
alias loadssh='eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519'

# Generate passwords
alias gen='echo $(pwgen -s 6 1)-$(pwgen -s 6 1)-\$$(pwgen -s 2 1)-$(pwgen -s 6 1)'

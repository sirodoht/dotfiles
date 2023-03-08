# Source bash prompt
source ~/.bash_prompt;

# Source aliases
source ~/.bash_aliases;

# Make vim the default editor.
export EDITOR='vim';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using cd
shopt -s cdspell;

# Change to directory even if there is no `cd` command
shopt -s autocd;

# Enable double star expand
shopt -s globstar;

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH";

# Add golang bin to PATH
export PATH="$HOME/go/bin:$PATH";

# Load rust env
source "$HOME/.cargo/env"

# Add Python bin to PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH";

# Add deno bin to PATH
export PATH="/Users/sirodoht/.deno/bin:$PATH";

# Load rbenv
eval "$(~/.rbenv/bin/rbenv init - bash)";

# Load anaconda
__conda_setup="$('/Users/sirodoht/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Enable bash completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable bash completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# Enable bash completions
source "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash";
source "$HOME/.nix-profile/share/bash-completion/completions/fd.bash";
source "$HOME/.nix-profile/share/bash-completion/completions/nix";
source "$HOME/.nix-profile/share/bash-completion/completions/rg.bash";
source "$HOME/.nix-profile/share/bash-completion/completions/zoxide.bash";

# Enable zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init posix --hook prompt)";

# Add fzf bash completion and key bindings
# https://github.com/junegunn/fzf
source "$HOME/.nix-profile/share/fzf/completion.bash";
source "$HOME/.nix-profile/share/fzf/key-bindings.bash";
# fzf options
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse';
export FZF_CTRL_R_OPTS='--height 40% --layout=reverse';
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Change fzf ** completion to use fd respecting gitignore
function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1";
}
# Change fzf CTRL-T cmd to use fd respecting gitignore
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1";
}

# Zip a directory omitting .DS_Store files
function zipds() {
	zip -r "$@".zip "$@" -x "*.DS_Store"
}

# UTF-8-encode a string of Unicode symbols
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Load nix
source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh";

# Load direnv (should be last)
# https://github.com/direnv/direnv
eval "$(direnv hook bash)";

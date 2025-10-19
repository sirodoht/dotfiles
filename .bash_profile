# Source bash prompt
source ~/.bash_prompt;

# Source aliases
source ~/.bash_aliases;

# Increase open files limit
ulimit -n 1048575;

# Make vim the default editor
export EDITOR='vim';

# Increase Bash history size
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}";

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file instead of overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using cd
shopt -s cdspell;

# Change to directory even if there is no `cd` command
shopt -s autocd;

# Enable double star expand
shopt -s globstar;

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH";

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Add golang bin to PATH
export PATH="$HOME/go/bin:$PATH";

# Load rust env
export PATH="$HOME/.cargo/bin:$PATH";

# Add Python bin to PATH
#export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH";

# Add deno bin to PATH
export PATH="/Users/sirodoht/.deno/bin:$PATH";

# Load rbenv
eval "$(~/.rbenv/bin/rbenv init - bash)";

# Load anaconda
__conda_setup="$('/Users/sirodoht/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sirodoht/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sirodoht/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sirodoht/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Add Postgres.app to PATH
export PATH="/Applications/Postgres.app/Contents/Versions/16/bin:$PATH";

# Add Foundry to PATH
export PATH="$PATH:/Users/sirodoht/.foundry/bin";

# Google Cloud SDK
if [ -f '/Users/sirodoht/google-cloud-sdk/path.bash.inc' ]; then . '/Users/sirodoht/google-cloud-sdk/path.bash.inc'; fi
# gcloud shell command completion
if [ -f '/Users/sirodoht/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/sirodoht/google-cloud-sdk/completion.bash.inc'; fi

# Windsurf
export PATH="$PATH:/Users/sirodoht/.codeium/windsurf/bin";

# Load brew
eval "$(/opt/homebrew/bin/brew shellenv)";

# Enable bash completion for jujutsu
source <(jj util completion bash)

# Enable bash completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable bash completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# Enable bash completions
source "/opt/homebrew/etc/bash_completion.d/pass";
source "/opt/homebrew/etc/bash_completion.d/zoxide";

# Configure fzf
# https://github.com/junegunn/fzf
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

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Enable zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init posix --hook prompt)";

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH";

# Load direnv (should be last)
# https://github.com/direnv/direnv
eval "$(direnv hook bash)";

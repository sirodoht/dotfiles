# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for git
source /Users/sirodoht/bin/bash_completion/git-completion.bash;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Extra brew path for some taps
export PATH="/usr/local/sbin:$PATH";

# Rust bin path
export PATH="/Users/sirodoht/.cargo/bin:$PATH";

# Golang bin path
export PATH="/Users/sirodoht/.go/bin:$PATH";

# fzf setup
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin";
fi
# fzf auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null;
# fzf key bindings
source "/usr/local/opt/fzf/shell/key-bindings.bash";
# fzf - use fd instead of the default find command for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1";
}
# fzf - use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1";
}

# gopass bash completion
source <(gopass completion bash);

# zoxide
eval "$(zoxide init posix --hook prompt)";

# gcloud - first in PATH because of /Applications/Docker.app/Contents/Resources/bin/kubectl
export PATH="/Users/sirodoht/bin/google-cloud-sdk/bin:$PATH";
source "/Users/sirodoht/bin/google-cloud-sdk/completion.bash.inc";

# direnv - should be last
eval "$(direnv hook bash)";

# nix
source /Users/sirodoht/.nix-profile/etc/profile.d/nix.sh;

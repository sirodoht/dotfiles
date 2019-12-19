# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
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

# Silence crontab mails on term login
unset MAILCHECK

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for git
source /Users/sirodoht/bin/bash_completion/git-completion.bash

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Extra brew path for some taps
export PATH="/usr/local/sbin:$PATH";

# z - jump around
source "$(brew --prefix)/etc/profile.d/z.sh";

# Add Rust lang bin to path
export PATH="$PATH:~/.cargo/bin";

# Updates PATH for the Google Cloud SDK
#source '/Users/sirodoht/bin/google-cloud-sdk/path.bash.inc'
# Enables shell command completion for gcloud.
#source '/Users/sirodoht/bin/google-cloud-sdk/completion.bash.inc'

# Add tab completion for kubectl, kubectx, kubens
#source '/Users/sirodoht/bin/bash_completion/kubectl.bash'
#source '/Users/sirodoht/bin/bash_completion/kubectx.bash'
#source '/Users/sirodoht/bin/bash_completion/kubens.bash'

# Add kubectl tab completion to `k` alias
#source <(kubectl completion bash | sed 's/kubectl/k/g')

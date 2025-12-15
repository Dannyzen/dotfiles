# --- Environment Variables ---
# Set static variables first for clarity and speed.
export DOTFILES=$HOME/.homesick/repos/dotfiles
export DOTFILES_HOME=${DOTFILES}/home
export EDITOR="vim"
export VISUAL="vim"
export GOPATH=$HOME/go
export TZ=:/etc/localtime # This is a good optimization, keep it.

# --- Zsh History Settings ---
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
setopt INTERACTIVE_COMMENTS GLOB_DOTS AUTO_CD
unsetopt SHARE_HISTORY # This is clearer than 'setopt no_share_history'

# --- PATH Management ---
# Use typeset -U to keep PATH unique and prevent duplicates, which speeds up command lookups.
typeset -U path
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$GOPATH/bin"
    "$HOME/.npm-global/bin" # For Node packages
    "$PYTHONUSERBASE/bin" # For Python packages
    "/usr/local/heroku/bin"
    # System paths
    /usr/local/bin
    /usr/bin
    /bin
)

# --- Zsh Completion System (Optimized) ---
# This checks if the completion dump file is older than one day
# and rebuilds it only when necessary, speeding up daily shell starts.
autoload -U compinit
if [ -n "$HOME/.zcompdump"(N.m+1) ]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*:(all-|)files' ignored-patterns '*?.pyc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# --- FZF Path ---
# Add fzf binary to path (cloned by Antidote)
export PATH="$HOME/.antidote/https-COLON--SLASH--SLASH-www.github.com-SLASH-junegunn-SLASH-fzf/bin:$PATH"

# --- Plugin Manager (Antidote) ---
# export ZSH="$DOTFILES/oh-my-zsh" # REMOVED: Managed by Antidote internal cache now.
export ANTIDOTE_HOME="$HOME/.antidote"
source "$DOTFILES/antidote/antidote.zsh"
antidote load "$DOTFILES_HOME/.zsh_plugins.txt"

# --- Source Local Configs ---
# Source these *after* plugins are loaded.
source "$DOTFILES_HOME/.aliases"
source "$DOTFILES_HOME/.funcs"
[ -f "$HOME/.shush" ] && . "$HOME/.shush"

# --- Lazy Loading NVM (Node Version Manager) ---
# NVM is very slow to load. This makes it load only when you actually use 'nvm', 'node', or 'npm'.
export NVM_DIR="$HOME/.nvm"
lazy_load_nvm() {
  unset -f nvm node npm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
nvm() { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
#npm() { lazy_load_nvm; npm "$@"; }

# --- RVM & OS-Specific ---
# Load RVM at the end. Its path will be added dynamically.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load OS-specific settings. The 'uname' check is fast.
if [[ "$(uname -s)" == "Darwin" ]]; then
    source ~/.profile # Consider reviewing ~/.profile for slow commands
    [ -z "$JAVA_HOME" ] && export JAVA_HOME=$(/usr/libexec/java_home)
fi

# --- Google Cloud SDK ---
# This is fine at the end as it just modifies the path.
if [ -f '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then
    source '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'
fi

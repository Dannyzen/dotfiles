#env
export DOTFILES=$HOME/.homesick/repos/dotfiles
export DOTFILES_HOME=${DOTFILES}/home

ZSH=$DOTFILES/oh-my-zsh

#Theme
ZSH_THEME="af-magic"

#Go Go Antigen -----------------------------------------
source $DOTFILES/antigen/antigen.zsh
antigen init .antigenrc

# OSX handling
os=$(uname -s)
case $os in
    "Darwin" )
        source ~/.profile
        export JAVA_HOME=$(/usr/libexec/java_home)
esac

# Editor
if [[ -x $(which vim) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

#something something compiled python
zstyle ':completion:*:(all-|)files' ignored-patterns '*?.pyc'

#something something case insensitivity
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -U compinit && compinit

# History
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
unsetopt share_history
SAVEHIST=10000
HISTSIZE=10000

#noshare the history!
setopt no_share_history

#Interactive Comments
setopt interactivecomments

#Globdots - !. !!! 
setopt globdots

#Auto cd
setopt autocd

# Sourcing
source $ZSH/oh-my-zsh.sh
source $DOTFILES_HOME/.aliases
source $DOTFILES_HOME/.funcs

if [ -f $HOME/.shush ]; then
    . $HOME/.shush
fi

#agent 
zstyle :omz:plugins:ssh-agent agent-forwarding on

#https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/ told me to
export TZ=:/etc/localtime

# More paths
# Go
export GOPATH=$HOME/go
export HEROKUPATH="/usr/local/heroku/bin"
export OLDPATH=/usr/local/bin/:/usr/bin:/bin:/usr/share/ruby-rvm/bin:$HOME/.rbenv/bin:$PYTHONUSERBASE/bin
export RVMPATH="$HOME/.rvm/bin"
export NODE="$HOME/.npm-global/bin"
export HOMEBINS="$HOME/bin"
export PATH="$PATH:$OLDPATH:$HOME:$GOPATH:$HEROKUPATH:$RVMPATH:$NODE:$HOMEBINS"

#RVM sorcery
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then source '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/danny/testing/gcloud/google-cloud-sdk-168.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc'; fi

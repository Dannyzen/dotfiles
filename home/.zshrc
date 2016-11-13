#env
export DOTFILES=$HOME/.homesick/repos/dotfiles
export DOTFILES_HOME=${DOTFILES}/home

ZSH=$DOTFILES/oh-my-zsh

#Theme
ZSH_THEME="af-magic"

#Go Go Antigen
source $DOTFILES/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git 
antigen bundle ssh-agent 
antigen bundle virtualenv 
antigen bundle python 
antigen bundle pip 
antigen bundle vundle 
antigen bundle archlinux 
antigen bundle nvm 
antigen bundle dannyzen/zsh-syntax-highlighting
antigen theme af-magic
antigen bundle djui/alias-tips

# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-completions

antigen apply

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
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

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


# More paths
# Go
export GOPATH=$HOME/go
export HEROKUPATH="/usr/local/heroku/bin"
export OLDPATH=/usr/local/bin/:/usr/bin:/bin:/usr/share/ruby-rvm/bin:$HOME/.rbenv/bin:$PYTHONUSERBASE/bin
export RVMPATH="$HOME/.rvm/bin"
export NODE="$HOME/.npm-global/bin"
export PATH="$PATH:$OLDPATH:$HOME:$GOPATH:$HEROKUPATH:$RVMPATH:$NODE"
export BUILDPACKS="$HOME/dev/buildpackery"

#RVM sorcery
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

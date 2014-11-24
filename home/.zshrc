#env
export REMOTE_DOTFILES=dotfiles
export DOTFILES=$HOME/.homesick/repos/${REMOTE_DOTFILES}
export DOTFILES_HOME=${DOTFILES}/home

#dicey
export PYTHONUSERBASE=$HOME/.local/lib/python2.7/site-packages/
# export PYTHON_LOCAL_SITE_PACKAGES=$PYTHONUSERBASE/lib/python2.7/site-packages

ZSH=$DOTFILES/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv python pip ssh-agent vundle zsh-syntax-highlighting)

# OSX handling
os=`uname -s`
case $os in
    "Darwin" )
        source ~/.profile
        export JAVA_HOME=/Library/Java/Home
        export EC2_HOME=$HOME/ec2-api-tools-1.6.10.1/
esac

# Editor
if [[ -x $(which vim) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Quick find
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

zstyle ':completion:*:(all-|)files' ignored-patterns '*?.pyc'

# #autojump tab completion
# autoload -U compinit && compinit
# setopt nolistambiguous #only one tab for autocompletion for 'j'
# [[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh


# History
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
SAVEHIST=10000
HISTSIZE=10000

#Interactive Comments
setopt interactivecomments

#Globdots - !. !!! 
setopt globdots

#Auto cd
setopt autocd

# Sourcing
source $ZSH/oh-my-zsh.sh
source $DOTFILES_HOME/.bash_alias
source $DOTFILES_HOME/.apps

if [ -f $HOME/qa/.bash_alias ]; then
    . $HOME/qa/.bash_alias
fi

if [ -f $HOME/.shush ]; then
    . $HOME/.shush
fi

export PATH=$PATH:/usr/local/bin/:/usr/bin:/bin:/usr/share/ruby-rvm/bin:$HOME/.rbenv/bin:$PYTHONUSERBASE/bin

#agent 
zstyle :omz:plugins:ssh-agent agent-forwarding on

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GREP_OPTIONS=" --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --ignore-case"

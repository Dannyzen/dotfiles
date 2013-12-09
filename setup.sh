#!/bin/bash
sudo gem install homesick 
homesick clone git@github.com:Dannyzen/dotfiles.git 
homesick symlink 
vim +BundleInstall +qall
ln -s $DOTFILES/zsh-syntax-highlighting $ZSH_CUSTOM/zsh-syntax-highlighting

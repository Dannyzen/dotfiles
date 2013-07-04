#!/bin/bash
sudo gem install homesick 
homesick clone Dannyzen/dotfiles
homesick symlink Dannyzen/dotfiles
vim +BundleInstall +qall

#!/bin/bash
sudo gem install homesick 
homesick clone Dannyzen/dotfiles
homesick symlink Dannyzen/dotfiles
vim +BundleInstall +qall

#colorizing git configs. If i get more of these I should break this out into it's own .sh and source it here.
git config --global color.diff always

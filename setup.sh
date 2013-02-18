#!/bin/bash
sudo gem install homesick
homesick clone Dannyze/dotfiles
homesick symlink Dannyzen/dotfiles
vim +BundleInstall +qall

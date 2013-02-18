#!/bin/bash
curl -sL https://raw.github.com/andsens/homeshick/master/install.sh | bash
alias homesick="$HOME/.homeshick"
homesick clone Dannyzen/dotfiles
homesick symlink Dannyzen/dotfiles
vim +BundleInstall +qall

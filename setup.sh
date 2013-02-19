#!/bin/bash
curl -sL https://raw.github.com/andsens/homeshick/master/install.sh | bash
$HOME/.homeshick clone Dannyzen/dotfiles
$HOME/.homeshick symlink Dannyzen/dotfiles
vim +BundleInstall +qall

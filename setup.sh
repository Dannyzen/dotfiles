#!/bin/bash
curl -sL https://raw.github.com/andsens/homeshick/master/install.sh | bash
$HOME/.homeshick clone Dannyzen/dotfiles
$HOME/.homeshick symlink dotfiles
vim +BundleInstall +qall

#colorizing git configs. If i get more of these I should break this out into it's own .sh and source it here.
git config --global color.diff always


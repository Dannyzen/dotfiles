#!/bin/bash

# link app configs to dotfiles
ln -s $DOTFILES/kde/share/apps/konsole $HOME/.kde/share/apps/konsole 
ln -s $DOTFILES/kde/share/apps/yakuake $HOME/.kde/share/apps/yakuake 


# link rc configs to dotfiles
ln -s $DOTFILES/kde/config/konsolerc $HOME/.kde/share/config/konsole
ln -s $DOTFILES/kde/config/krunnerrc $HOME/.config/krunnerrc
ln -s $DOTFILES/kde/config/dolphinrc $HOME/.config/dolphinrc
ln -s $DOTFILES/kde/config/kglobalshortctsrc $HOME/.config/kglobalshortcutsrc
ln -s $DOTFILES/home/psd ~/.config/psd

# remove write access
chmod -w ~/.local/share/recently-used.xbel
chmod -w ~/.kde/share/apps/RecentDocuments/

# Do wonderful things to vim
vim +BundleInstall +qall

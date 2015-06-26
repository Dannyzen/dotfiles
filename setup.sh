#!/bin/bash

# link zsh syntax highlighting
ln -s $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh $ZSH_CUSTOM/zsh-syntax-highlighting.zsh

# link app configs to dotfiles
ln -s $DOTFILES/kde/share/apps/konsole $HOME/.kde/share/apps/konsole 
ln -s $DOTFILES/kde/share/apps/yakuake $HOME/.kde/share/apps/yakuake 
ln -s $DOTFILES/kde/share/apps/dolphin $HOME/.kde/share/apps/dolphin 


# link rc configs to dotfiles
ln -s $DOTFILES/kde/config/konsolerc $HOME/.kde/share/config/konsole
ln -s $DOTFILES/kde/config/krunnerrc $HOME/.kde/share/config/krunnerrc
ln -s $DOTFILES/kde/config/dolphinrc $HOME/.kde/share/config/dolphinrc
ln -s $DOTFILES/kde/config/kglobalshortctsrc $HOME/.kde/share/config/kglobalshortcutsrc

# remove write access
chmod -w ~/.local/share/recently-used.xbel
chmod -w ~/.kde/share/apps/RecentDocuments/

# Do wonderful things to vim
vim +BundleInstall +qall

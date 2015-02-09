#!/bin/bash
sudo gem install homesick 
homesick clone git@github.com:Dannyzen/dotfiles.git 
homesick symlink 
vim +BundleInstall +qall
ln -s $DOTFILES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh $ZSH_CUSTOM/zsh-syntax-highlighting.zsh
ln -s $DOTFILES/kde/yakuake/kns_skins kns_skins
rm $HOME/.kde/share/apps/konsole/Shell.profile && ln -s $DOTFILES/kde/konsole/Shell.profile $HOME/.kde/share/apps/konsole/Shell.profile
ln -s $DOTFILES/kde/konsole/kosoleui.rc $HOME/.kde/share/apps/konsole/konsoleui.rc
ln -s $DOTFILES/kde/konsole/Linux.colorscheme $HOME/.kde/share/apps/konsole/Linux.colorscheme
rm $HOME/.kde/share/config/kglobalshortcutsrc && ln -s $DOTFILES/kde/kglobalshortcutsrc $HOME/.kde/share/config/kglobalshortsrc
rm $HOME/.kde/share/config/yakuakerc && ln -s $DOTFILES/kde/yakuake/yakuakerc $HOME/.kde/share/config/yakuakerc
chmod -w ~/.local/share/recently-used.xbel
chmod -w ~/.kde/share/apps/RecentDocuments/

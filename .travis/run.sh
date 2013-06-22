#!/usr/bin/env zsh
emulate -L zsh
setopt err_exit no_unset warn_create_global
#setopt xtrace

git ls-files -z -- '.zsh*' | while read -rd $'\0' file; do
    echo -n "Syntax checking $file... "
    zsh -o no_exec -o no_rcs $file
    echo "OK"
done

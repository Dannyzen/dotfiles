#!/usr/bin/env zsh
emulate -L zsh
stderr_size=$(source ~/.zshrc 2>&1 1>/dev/null )
if [ ${#stderr_size} = 0 ]; 
    then 
        exit 0 
    else
        exit 1 
fi

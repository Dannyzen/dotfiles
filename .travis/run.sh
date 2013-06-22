#!/usr/bin/env zsh
emulate -L zsh
output=$(source ~/.zshrc 2>&1 1>/dev/null )
out_leng=$(expr length $output 2>/dev/null ) 
if [ -z "$out_leng" ]; 
    then 
       exit 1 
    else
       exit 0 
fi

##!/bin/bash

# mkdir -p ~/.backup.dotfiles/
# backup existing dotfiles?

declare -A exclude

# list of files to exclude
for file in \
    "." ".." ".git" "ignore" "install.sh"
do
    exclude[$HOME/dotfiles/$file]=1
done

# link to dotfiles from home dir
for file in $HOME/dotfiles/* $HOME/dotfiles/.*; do
    if [[ ! ${exclude["$file"]} ]]; then
	echo "linking to $file"
	ln -sf $file $HOME/
    fi
done

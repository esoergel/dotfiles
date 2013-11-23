##!/bin/bash

#dir=~/dotfiles                    # dotfiles directory
#olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

###########

#mkdir -p ~/.backup.dotfiles/

#cd $dir

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
#for file in $files; do
    #echo "Moving any existing dotfiles from ~ to $olddir"
    #mv ~/.$file ~/dotfiles_old/
    #echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/.$file
#done

##sdlfsfdsf

declare -A exclude

# list of files to exclude
for file in \
    "." ".." "git" "ignore" "install.sh"
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


#for f in ~/dotfiles/.*; do
    #if [[ ! $f == "git" ]]; then
	#ln -sf $f ~/
    #fi
#done

# set up array of constants
#declare -A array
#for constant in \
  #foo bar baz

#do
    #array[$constant]=1
#done

## test for existence
#test1="bar"
#test2="xyzzy"

#if [[ ${array[$test1]} ]]; then echo "bar Exists"; fi    # Exists
#if [[ ${array[$test2]} ]]; then echo "xyzzy Exists"; fi    # doesn't

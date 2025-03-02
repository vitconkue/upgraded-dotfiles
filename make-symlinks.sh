#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
## Change this #####

# dotfiles directory
# edit this with the path to the backup repository
dir=~/upgraded-dotfiles

# old dotfiles backup directory
# edit this with the path to make a copy of your dotfiles before running the script
olddir=~/upgraded-dotfiles/dotfiles_old

# list of files/folders to symlink in homedir
# edit this with the files you want to backup
files="vimrc bashrc zshrc config/nvim/init.vim"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
        echo "Moving any existing dotfiles from ~ to $olddir"
            mv ~/.$file $olddir/
                echo "Creating symlink to $file in home directory."
                    ln -s $dir/$file ~/.$file
done

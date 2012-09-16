#!/usr/bin/bash
function set_script_dir {
  # base folder of this script: http://stackoverflow.com/questions/192319/in-the-bash-script-how-do-i-know-the-script-file-name 
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  echo $DIR
}
DIR=$(set_script_dir)
cd ~

# Backup existing files (killing existing backups first)
echo "Destroying old backups..."
if [ -d $DIR/backups ]; then
  rm -rf $DIR/backups
fi

echo "Making new backups..."
mkdir -p $DIR/backups

mv -f ~/.bash_profile $DIR/backups/
mv -f ~/.tm_properties $DIR/backups/
mv -f ~/.vim $DIR/backups/
mv -f ~/.vimrc $DIR/backups/
mv -f ~/.emacs.d $DIR/backups/
mv -f ~/.emacs $DIR/backups
mv -f ~/.gitconfig $DIR/backups/
mv -f ~/.tmux.conf $DIR/backups/

# Set up symbolic links
echo "Setting up symbolic links..."
ln -s $DIR/.bash_profile
ln -s $DIR/.tm_properties
ln -s $DIR/.vim
ln -s $DIR/.vimrc
ln -s $DIR/.emacs.d
ln -s $DIR/.emacs
ln -s $DIR/.gitconfig
ln -s $DIR/.tmux.conf

# Create backup and temp folders for vim if they don't exist already
echo "Creating _backup and _temp folders for vim..."
if [ ! -d $DIR/.vim/_backup ]; then
  echo "Creating $DIR/.vim/_backup..."
  mkdir $DIR/.vim/_backup
fi

if [ ! -d $DIR/.vim/_temp ]; then
  echo "Creating $DIR/.vim/_temp..."
  mkdir $DIR/.vim/_temp
fi

# Install Command-T VIM plugin
cd $DIR/.vim/bundle/command-t
rake make
cd ~

# Sourcing from .bash_profile
echo "Source from ~/.bash_profile ..."
source ~/.bash_profile

# Done!
echo "DONE!"

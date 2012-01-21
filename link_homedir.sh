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
rm -rf $DIR/backups
mkdir -p $DIR/backups

mv -f ~/.bash_profile $DIR/backups/
mv -f ~/.vim $DIR/backups/
mv -f ~/.vimrc $DIR/backups/
mv -f ~/.gitconfig $DIR/backups/

# Set up symbolic links
ln -s $DIR/.bash_profile
ln -s $DIR/.vim
ln -s $DIR/.vimrc
ln -s $DIR/.gitconfig

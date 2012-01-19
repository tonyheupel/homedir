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
ln -s $DIR/.bash_profile
ln -s $DIR/.vim
ln -s $DIR/.vimrc
ln -s $DIR/.gitconfig

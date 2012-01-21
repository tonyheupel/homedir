# Install the latest version of homedir
cd ~
git clone git@github.com:tchype/homedir.git .homedir

# Link the files and folders in .homedir as if they were in
# your ~ folder
sh .homedir/link_homedir.sh

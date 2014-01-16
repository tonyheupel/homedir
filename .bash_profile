[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Set git autocompletion and PS1 integration
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
  fi
  GIT_PS1_SHOWDIRTYSTATE=true

  if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
  fi

# use newer git-prompt.sh to get __git_ps1 defined now
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
  fi

  # Include my Git integration
# if [ -f ~/.homedir/git_prompt.sh ]; then
#   . ~/.homedir/git_prompt.sh
# fi

# Prompt
# export PS1="\\u@\h:\[\033[0;34m\]\\W\[\033[0m\]\$(git_start_prompt)\[\033[0;33m\]\$(git_revision_prompt)\[\033[0m\]\$(git_mid_prompt)\[\033[0;\$(git_branch_prompt_color)m\]\$(git_branch_prompt)\[\033[0m\]\$(git_end_prompt)\$ "

PS1='\u@\h:\[\033[0;34m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\$ '

# ls Alias
alias ls='ls -GF'


# tmux - ensure 256 colors
alias tmux="TERM=screen-256color-bce tmux"

# Exhuberant ctags
alias ctags="`brew --prefix`/bin/ctags"

# rbenv --> Unix-style ruby runtime manager
# enable shims and autocompletion for rbenv
# eval "$(rbenv init -)"

export PATH=/usr/local/bin:$PATH

PLAN9=/usr/local/plan9 export PLAN9
PATH=$PATH:$PLAN9/bin   export PATH

export GOROOT=/usr/local/Cellar/go/1.0.3
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$HOME/Projects/go/bin:$HOME/Library/Haskell/bin:

# machine-specific profile settings
if [ -f ~/.machine_specific_profile ]; then
  . ~/.machine_specific_profile
fi

##
# Your previous /Users/theupel/.bash_profile file was backed up as /Users/theupel/.bash_profile.macports-saved_2013-01-28_at_15:11:03
##

# MacPorts Installer addition on 2013-01-28_at_15:11:03: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#rbenv
eval "$(rbenv init - --no-rehash)"

#whitepages certs
export SSL_CERT_FILE=/System/Library/OpenSSL/certs/WhitepagesCARoot.pem

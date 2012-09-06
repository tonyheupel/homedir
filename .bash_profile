[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash
  fi
  GIT_PS1_SHOWDIRTYSTATE=true

  if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
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

# machine-specific profile settings
if [ -f ~/.machine_specific_profile ]; then
  . ~/.machine_specific_profile
fi

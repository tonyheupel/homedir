# Include Git integration
if [ -f ~/.homedir/git_prompt.sh ]; then
  . ~/.homedir/git_prompt.sh
fi

# Prompt
export PS1="\\u@\h:\[\033[0;34m\]\\W\[\033[0m\]\$(git_start_prompt)\[\033[0;33m\]\$(git_revision_prompt)\[\033[0m\]\$(git_mid_prompt)\[\033[0;\$(git_branch_prompt_color)m\]\$(git_branch_prompt)\[\033[0m\]\$(git_end_prompt)\$ "

#PS1='\[\033[32m\]\u\[\033[00m\] \[\033[34m\]\W\[\033[33m\]$(git_prompt)\[\033[00m\]\$ '

# ls Alias
alias ls='ls -GF'


# tmux - ensure 256 colors alias tmux="TERM=screen-256color-bce tmux" 

# rbenv --> Unix-style ruby runtime manager
# enable shims and autocompletion for rbenv
eval "$(rbenv init -)"


# machine-specific profile settings
if [ -f ~/.machine_specific_profile ]; then
  . ~/.machine_specific_profile
fi

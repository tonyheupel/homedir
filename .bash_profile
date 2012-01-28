# Git status
function is_git_repo {
 error=$((git branch) 2>&1)
  if [[ $error == fatal:* ]]; then
    echo "false"
  else
    echo "true"
  fi
}

function git_revision {
  git log --oneline -1 | awk 'BEGIN { FS = " " } ; {print $1}'
}

function git_branch {
  git branch | grep "^\*" | awk 'BEGIN { FS = " " } ; {print $2}'
}

function git_prompt {
  if [ "$(is_git_repo)" == "true" ]; then
    echo " (`git_revision`|`git_branch`)"
  fi
}


# Prompt
PS1="\\u@\h:\[\033[0;34m\]\\W\[\033[0m\]\$(git_prompt)\$ "


# ls Alias
alias ls='ls -GF'


# tmux - ensure 256 colors alias tmux="TERM=screen-256color-bce tmux" 

# rbenv --> Unix-style ruby runtime manager
# enable shims and autocompletion for rbenv
eval "$(rbenv init -)"


# machine-specific profile settings
if [ -f ~/.machine_specific_profile ]; then
  source ~/.machine_specific_profile
fi

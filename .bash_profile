# Git status
function is_git_repo {
 error=$((git branch) 2>&1)
  if [[ $error == fatal:* ]]; then
    return 0
  else
    return 1
  fi
}

function git_revision {
  git log --oneline -1 | awk 'BEGIN { FS = " " } ; {print $1}'
}

function git_branch {
  git branch | grep "^\*" | awk 'BEGIN { FS = " " } ; {print $2}'
}

function git_prompt {
  is_git_repo
  in_git=$?

  if [ $in_git -eq 1 ]; then
    echo " (`git_revision`|`git_branch`)"
  fi
}


# Prompt
PS1="\\u@\h:\\W\$(git_prompt)\$ "


# ls Alias
alias ls='ls -GF'


# tmux - ensure 256 colors
alias tmux="TERM=screen-256color-bce tmux"


# rbenv --> Unix-style ruby runtime manager
# enable shims and autocompletion for rbenv
eval "$(rbenv init -)"


# machine-specific profile settings
if [ -f ~/.machine_specific_profile ]; then
  source ~/.machine_specific_profile
fi

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

# original implementation (no colors inside)
function git_prompt {
  if [ "$(is_git_repo)" == "true" ]; then
    echo " (`git_revision`|`git_branch`)"
  fi
}

function git_start_prompt {
  if [ "$(is_git_repo)" == "true" ]; then
    echo " ("
  fi
}

function git_mid_prompt {
  if [ "$(is_git_repo)" == "true" ]; then
    echo "|"
  fi
}

function git_end_prompt {
  if [ "$(is_git_repo)" == "true" ]; then
    echo ")"
  fi
}

function git_revision_prompt {
 if [ "$(is_git_repo)" == "true" ]; then
    echo "`git_revision`"
 fi
}

function git_branch_prompt {
 if [ "$(is_git_repo)" == "true" ]; then
    echo "`git_branch`"
 fi
}

function git_branch_prompt_color {
  if [ "$(is_git_repo)" == "true" ]; then
    status="$(git status)"

    if [[ "$status" =~ "Changes not staged for commit" || "$status" =~ "Untracked files"  ]]; then
      echo "0;31"
    elif [[ "$status" =~ "Changes to be committed" ]]; then
      echo "0;32"
    else
      echo "0"
    fi
  fi
}

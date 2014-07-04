git_dirty_indicator()
{
  git_status=$(git status --porcelain)

  if [ -z "$git_status" ]
  then
    echo "\[\e[1;32m\]●\[\e[m\]"
  else
    echo "\[\e[1;31m\]●\[\e[m\]"
  fi
}

bash_prompt()
{
  git_branch=$(git rev-parse --abbrev-ref HEAD)
  ruby_version="\[\e[0;35m\]$(ruby --version | awk '{print $2}')\[\e[m\]"
  blue_git_branch="\[\e[0;34m\]$git_branch\[\e[m\]"
  arrow="\[\e[0;33m\]»\[\e[m\]"
  path="\[\e[0;32m\]\w\[\e[m\]"

  PS1="$(git_dirty_indicator) $blue_git_branch $path $arrow "
}

PROMPT_COMMAND=bash_prompt

alias be="nocorrect bundle exec"
alias ip="curl icanhazip.com"
alias pl="swipl"
alias prune="git fetch --prune && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"

source ~/.environment
source ~/.secrets
source ~/.chruby

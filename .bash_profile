git_dirty_indicator()
{
  git_status=$(git status --porcelain 2> /dev/null)
  [ $? -ne 0 ] && return

  if [ -z "$git_status" ]
  then
    echo "\[\e[1;32m\]●\[\e[m\] "
  else
    echo "\[\e[1;31m\]●\[\e[m\] "
  fi
}

git_branch()
{
  git_branch2=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  [ $? -ne 0 ] && return

  echo "\[\e[0;34m\]$git_branch2\[\e[m\] "
}

bash_prompt()
{
  ruby_version="\[\e[0;35m\]$(ruby --version | awk '{print $2}')\[\e[m\]"
  arrow="\[\e[0;33m\]»\[\e[m\]"
  path="\[\e[0;32m\]\w\[\e[m\]"

  if [ -n "$SSH_CLIENT" ]; then
    host="\[\e[0;35m\]\h:\[\e[m\] "
  fi

  PS1="$host$(git_dirty_indicator)$(git_branch)$path $arrow "
}

PROMPT_COMMAND=bash_prompt

alias be="bundle exec"
alias brewup="brew update && brew upgrade"
alias ip="curl icanhazip.com"
alias jekylls="jekyll server --watch --drafts"
alias jf="GIT_EDITOR=\"mvim -f\" hub pull-request $@ | pbcopy"
alias pl="swipl"
# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune="git fetch --prune && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias swift="xcrun swift"
alias pd="pushd"
alias dp="popd"
alias railsup="rails new --template=~/.rails_template.rb $@"

source ~/.environment
source ~/.secrets
source ~/.chruby
source ~/.git-completion.bash

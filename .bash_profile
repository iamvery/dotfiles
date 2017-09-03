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

# Take advantage of https://github.com/iamvery/lita-reviewme from CLI
function review()
{
  curl "https://slack.com/api/chat.postMessage?token=$SLACK_TOKEN&channel=%23backend&text=~review%20$1&as_user=true&pretty=1"
}

PROMPT_COMMAND=bash_prompt

alias brewup='brew update && brew upgrade'
alias gutd='git checkout master && git pull --ff-only && prune && git checkout - && git rebase master'
alias wat="fswatch -o . | xargs -n1 -I{} $1"
alias ip='curl icanhazip.com'
alias jkl='jekyll server --watch --drafts'
alias jf='GIT_EDITOR="mvim -f" hub pull-request $@ | pbcopy'
alias json='python -m json.tool'
# http://solidfoundationwebdev.com/blog/posts/create-an-bash-function-to-open-latest-active-record-migration
alias lm='vim db/migrate/$(ls db/migrate | sort | tail -1)'
alias miex='iex -S mix'
alias pl=swipl
# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune='git fetch --prune && git branch --merged | grep -v "*" | xargs -n 1 git branch -d'
alias sync_tags='git tag -l | xargs git tag -d && git fetch'
alias pcpsql='psql -d partcycle-backend_development'
alias swift='xcrun swift'
alias pd=pushd
alias dp=popd
alias railsup="rails new --template=~/.rails_template.rb $@"
alias todo="grep --exclude-dir=coverage --exclude-dir=doc --exclude-dir=deps --exclude-dir=.git --exclude-dir=node_modules --recursive --ignore-case --extended-regex 'todo|fixme' ."
alias wip='git add . && git commit -m "wip [ci skip]"'

alias mts='mix test --stale'

source ~/.aliases
source ~/.environment
source ~/.secrets
source ~/.chruby
source ~/.git-completion.bash

positivity

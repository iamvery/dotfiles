set --export PGHOST '/var/pgsql_socket'
set --export EDITOR 'vim'
set --export ERL_AFLAGS '-kernel shell_history enabled'
set --export RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set --export FZF_DEFAULT_COMMAND 'rg --files'

set PATH $PATH $HOME/bin
set PATH '/Applications/Postgres.app/Contents/Versions/latest/bin' $PATH
set PATH $PATH $HOME/go/bin
# https://github.com/asdf-vm/asdf/pull/303, https://github.com/thoughtbot/dotfiles/issues/587
set PATH $HOME/.asdf/bin $PATH
set PATH $HOME/.asdf/shims $PATH
fish_add_path /opt/homebrew/opt/postgresql@15/bin

# http://solidfoundationwebdev.com/blog/posts/create-an-bash-function-to-open-latest-active-record-migration
alias lm='vim db/migrate/(ls db/migrate | sort | tail -1)'
# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune='git fetch --prune ; and git branch --merged | grep -v "*" | xargs -n 1 git branch -d'
alias wip='git add . ; and git commit -nm "wip [ci skip]"'
abbr be bundle exec

function gutd --argument-names branch
  set -q $branch; and set branch main
  git checkout $branch
  and git pull --ff-only
  and prune
  and git checkout -
  and git rebase $branch
end

source ~/.aliases
source ~/.secrets.fish

#bass source ~/.nvm/nvm.sh

source ~/.asdf/asdf.fish
eval "$(/opt/homebrew/bin/brew shellenv)"

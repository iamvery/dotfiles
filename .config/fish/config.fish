set --export PGHOST '/var/pgsql_socket'
set --export EDITOR 'vim'

set PATH $PATH $HOME/bin
set PATH '/Applications/Postgres.app/Contents/Versions/latest/bin' $PATH

# http://solidfoundationwebdev.com/blog/posts/create-an-bash-function-to-open-latest-active-record-migration
alias lm='vim db/migrate/(ls db/migrate | sort | tail -1)'
# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune='git fetch --prune ; and git branch --merged | grep -v "*" | xargs -n 1 git branch -d'
alias gutd='git checkout master ; and git pull --ff-only ; and prune ; and git checkout - ; and git rebase master'
alias wip='git add . ; and git commit -m "wip [ci skip]"'

source ~/.aliases
source ~/.secrets.fish

#bass source ~/.nvm/nvm.sh

source ~/.asdf/asdf.fish

# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune='git fetch --prune ; and git branch --merged | grep -v "*" | xargs -n 1 git branch -d'
alias wip='git add . ; and git commit -m "wip [ci skip]"'

source ~/.aliases

source /usr/local/opt/fry/share/fry/fry.fish
fry use 2.4 > /dev/null

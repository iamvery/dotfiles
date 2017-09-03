# http://stevenharman.net/git-clean-delete-already-merged-branches
alias prune='git fetch --prune ; and git branch --merged | grep -v "*" | xargs -n 1 git branch -d'
alias wip='git add . ; and git commit -m "wip [ci skip]"'

source ~/.aliases

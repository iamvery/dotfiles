set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Source local vim config when present
if filereadable('./.vimrc')
  source ./.vimrc
endif

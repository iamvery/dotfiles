execute pathogen#infect()

syntax on                 " show synatx highlighting
filetype plugin indent on

autocmd FocusLost * :wa        " autosave when file focus is lost
autocmd FileType gitcommit,markdown setlocal spell
autocmd FileType gitcommit,markdown set complete+=kspell
autocmd Filetype docbk,html,xml set formatexpr=SentencePerLine(v:lnum,v:lnum+v:count-1)
autocmd BufNewFile,BufRead *.ratchet setf html
autocmd BufNewFile,BufRead *.bolt setf html

"set background=light
"colorscheme solarized
colorscheme Tomorrow-Night

let mapleader=","               " set leader key to comma
let g:ctrlp_working_path_mode=0 " don't manage working directory
let g:ctrlp_jump_to_buffer=0    " disable jumping to already open buffer
let g:gist_clip_command='pbcopy'     " gist-vim: set clipboard command
let g:gist_open_browser_after_post=1 " gist-vim: open gist in browser
let g:rspec_command="Dispatch bundle exec rspec {spec}" " vim-rspec: use with vim-dispatch
let g:ctrlp_custom_ignore = {
\  'dir': '\v(_build|node_modules|deps)$',
\}

set autoread            " automatically re-read file changed outside of vim
set colorcolumn=80,100  " add column at 80 and 100 characters
set expandtab           " use spaces for <Tab>
set exrc                " enbale project specific configuration
set foldlevelstart=99   " don't fold anything by default
set foldmethod=indent   " "collapse" text blocks based on indentation
set gdefault            " use global substitution automatically
set hlsearch            " highlight search results
set ignorecase          " ignore case of normal letters in search
set list                " display unprintable characters
set mouse=a             " enable mouse in all modes
set noerrorbells        " don't use any bells for errors
set novisualbell        " don't use any visual flashes for errors
set nowrap              " do not wrap lines
set relativenumber      " show relative line numbers
set shiftwidth=2        " number of spaces for autoindent
set smartcase           " ignore case when the search patter contains only lowercase letters
set softtabstop=2       " number of spaces for <Tab> in editing
set splitright          " split new window to right of current
set splitbelow          " split new window below current
set tabstop=2           " number of spaces for <Tab> in file counts
set title               " set window title
set ttyfast             " use a fast terminal connection

set backupdir=~/.vim/_backup//             " directory for backup files
set directory=~/.vim/_temp//               " directory for swap files
set undodir=~/.vim/_temp//                 " directory for undo files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " ignore these patters for wildcard matching

match ErrorMsg '\s\+$'  " highlight trailing whitespace as error

""""""""""""""""
"" KEY MAPPINGS

" automatically prefix searches with "\v" (very magic)
nnoremap / /\v
vnoremap / /\v

" <leader><space> clears search
nnoremap <leader><space> :noh<cr>

" <leader><leader> toggles between files
nnoremap <leader><leader> <c-^>

" Disable arrow keys in command mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" <leader>v selects text that was just pasted
nnoremap <leader>v V`]

" <leader>w opens a vertical split window and switches to it
nnoremap <leader>w <C-w>v<C-w>l

" moving among splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" nerdtree
nnoremap <leader>n :NERDTree<cr><cr>

" visually select last edited/pasted text
nmap gV `[v`]

" insert hash rocket with <c-l>
imap <c-l> <space>=><space>

" use 'jj' as alternative for esc
"imap jj <Esc>
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
inoremap jK <Esc>
"inoremap <Esc> <nop>

" format ugly XML with a shortcut
nnoremap <leader>x :PrettyXML<cr>

" view blame for line
nnoremap <leader>b :Gblame<cr>

" browse line on github
nnoremap <leader><S-b> :Gbrowse<cr>

" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp

" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <Leader>md :call MarkedPreview()<CR>
map <Leader>m :!mix test<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
" https://github.com/stevenharman/config/blob/c11f6944c1752a3aa36b85ef0ff5a88a30cd8d09/vimrc.symlink#L333-L343
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

set secure

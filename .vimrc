execute pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!

syntax enable
filetype plugin indent on

set ttyfast
set wildmenu

set relativenumber
set ruler

set mouse=a

set encoding=utf-8

" whitespace
set nowrap
set list
set backspace=indent,eol,start

set listchars=""
set listchars=tab:\ \
set listchars+=trail:.

let mapleader=","

" more sane searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" <leader><space> clears search
nnoremap <leader><space> :noh<cr>

" <leader><leader> toggles between files
nnoremap <leader><leader> <c-^>

set colorcolumn=80,100

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

au FocusLost * :wa

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set splitright
set splitbelow

set noerrorbells
set novisualbell

set autoread

set gdefault

set title

set nobackup
set nowritebackup
set tags=./tmptags,./tags,tags
set backupdir=~/.vim/_backup//
set directory=~/.vim/_temp//

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"

" ctrlp
let g:ctrlp_working_path_mode=0 " don't manage working directory
let g:ctrlp_jump_to_buffer = 0  " disable jumping to already open buffer

" visually select last edited/pasted text
nmap gV `[v`]

" insert hash rocket with <c-l>
imap <c-l> <space>=><space>

" use OS clipboard by default
set clipboard=unnamed

colorscheme Tomorrow-Night


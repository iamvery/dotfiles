call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'elixir-editors/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'jceb/vim-orgmode'
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
Plug 'zorab47/procfile.vim'
"wildfire.vim
call plug#end()

syntax on                 " show synatx highlighting
filetype plugin indent on

function! SentencePerLine(start, end)
    silent execute a:start.','.a:end.'s/\n\s\+/ /'
    silent execute 's/[.!?]\zs /\r/'
endfunction

autocmd FocusLost * :wa        " autosave when file focus is lost
autocmd FileType gitcommit,markdown setlocal spell
autocmd FileType gitcommit,markdown set complete+=kspell
autocmd Filetype docbk,html,xml set formatexpr=SentencePerLine(v:lnum,v:lnum+v:count-1)
autocmd BufNewFile,BufRead *.ratchet setf html
autocmd BufNewFile,BufRead *.bolt setf html

" https://github.com/elixir-editors/vim-elixir/issues/562#issuecomment-1092331491
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

colorscheme Tomorrow-Night

let mapleader=","               " set leader key to comma
let g:ackprg = 'rg --vimgrep'
let g:ale_linters = {'ruby': ['standardrb']}

" https://github.com/mhinz/vim-mix-format/pull/43#issuecomment-1148609072
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['standardrb','rubocop'],
\  'elixir': ['mix_format'],
\  'eelixir': ['mix_format'],
\}
let g:ale_fix_on_save = 1

let g:ctrlp_working_path_mode=0 " don't manage working directory
let g:ctrlp_jump_to_buffer=0    " disable jumping to already open buffer
let g:gist_clip_command='pbcopy'     " gist-vim: set clipboard command
let g:gist_open_browser_after_post=1 " gist-vim: open gist in browser
let g:rspec_command="Dispatch bundle exec rspec {spec}" " vim-rspec: use with vim-dispatch

set autoread            " automatically re-read file changed outside of vim
set colorcolumn=80,100  " add column at 80 and 100 characters
set expandtab           " use spaces for <Tab>
"set ff=unix             " set default file type (for line endings)
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
set number              " show current line number
set relativenumber      " show relative line numbers
set shiftwidth=2        " number of spaces for autoindent
set smartcase           " ignore case when the search patter contains only lowercase letters
set softtabstop=2       " number of spaces for <Tab> in editing
set splitright          " split new window to right of current
set splitbelow          " split new window below current
set tabstop=2           " number of spaces for <Tab> in file counts
set title               " set window title
set ttyfast             " use a fast terminal connection
set updatetime=500      " configured for gitgutter

set backupdir=~/.vim/_backup//             " directory for backup files
set directory=~/.vim/_temp//               " directory for swap files
set undodir=~/.vim/_temp//                 " directory for undo files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " ignore these patters for wildcard matching

match ErrorMsg '\s\+$'  " highlight trailing whitespace as error

highlight clear SpellCap
highlight link SpellCap Underlined

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
nnoremap <leader>b :Git blame<cr>

" browse line on github
nnoremap <leader><S-b> :GBrowse<cr>

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

" Toggle relative line numbers
map <leader>. :set relativenumber!<cr>

" Map ctrl+p to fzf command
map <C-p> :Files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
" https://github.com/stevenharman/config/blob/c11f6944c1752a3aa36b85ef0ff5a88a30cd8d09/vimrc.symlink#L333-L343
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  normal! dd
  normal! P
  .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  normal ==
endfunction
command! PromoteToLet :call PromoteToLet()
map <leader>p :PromoteToLet<cr>

set exrc   " enable project specific configuration
set secure " but make sure that unsafe commands cannot be run

let g:lightcolors = 0
function! ToggleColors()
  if g:lightcolors == 1
    "unset background
    colorscheme Tomorrow-Night
    let g:lightcolors = 0
  else
    set background=light
    colorscheme solarized
    let g:lightcolors = 1
  endif
endfunction
command! ToggleColors :call ToggleColors()
map <leader>c :ToggleColors<cr>

let g:relativenumbers = 1
function! ToggleRelativeNumbers()
  if g:relativenumbers
    set norelativenumber
    let g:relativenumbers = 0
  else
    set relativenumber
    let g:relativenumbers = 1
  endif
endfunction
command! ToggleRelativeNumbers :call ToggleRelativeNumbers()
map <leader>N :ToggleRelativeNumbers<cr>

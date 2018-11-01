"General vimrc
"@pgurung
set nocompatible
filetype off
filetype plugin indent on 
runtime macros/matchit.vim

let mapleader = ' '

" Execute macro in q
map Q @q

nmap 0 ^
nmap k gk
nmap j gj
imap jk <esc>
imap kj <esc>

command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

imap <C-s> <esc>:w<cr>

"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax enable

"Color settings
if (has("termguicolors"))
 set termguicolors
endif

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

"Indenting
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set autoindent

set cursorline
set spelllang=en

"Allow mouse
set mouse=a
set laststatus=2
set noshowmode
set hidden

"Splits are created below and to the right
set splitbelow
set splitright

set noswapfile
set backspace=2
set incsearch
set history=50
set nobackup
set nowritebackup
set ruler
set autowrite

"numbers
set numberwidth=5
set number
set relativenumber

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set diffopt+=vertical
  
"Remove highlight after the search is done
nnoremap <silent> <leader>n :nohlsearch <CR>

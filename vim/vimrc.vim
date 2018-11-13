"General vimrc
"@pgurung
set nocompatible
filetype off
filetype plugin indent on 
runtime macros/matchit.vim

let mapleader = ' '

" Execute macro in q
map Q @q

"move to first character instead of the very beginning of the line
nmap 0 ^

"Move one global line at a time instead of what vim thinks is a line
nmap k gk
nmap j gj

imap jk <esc>
imap kj <esc>

"Common Typos
command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" Disable arrow Keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"Save and exit out of insert mode
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

"searching
set ignorecase
set smartcase

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

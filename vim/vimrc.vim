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

"Common Typos
command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

"Delete all but the current buffer
command! Bdall %bd!|e#|bd#

" Ctrl-c copies to system clipboard from visual mode
vnoremap <C-c> "*y

" Pasting from the system clipboard with LEADER-p
nnoremap <silent> <leader>p "*p
nnoremap <silent> <leader>P "*p
xnoremap <silent> <leader>p "*p

"Remap esc to C-\_C-n in terminal mode
tnoremap <Esc> <C-\><C-n>
" Start the terminal in insert mode
au BufEnter term://* startinsert

"Toggle netrw explorer with leader-e 
"========================================
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
        let g:netrw_chgwin=-1
    else
        let g:NetrwIsOpen=1
        silent Lexplore
        silent vertical resize 40
    endif
endfunction

noremap <silent> <leader>e :call ToggleNetrw()<CR>

"========================================
"Tree Style listing for Netrw
let g:netrw_liststyle=3

"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax enable

"Color settings
if (has("termguicolors"))
 set termguicolors
endif

set background=light

set colorcolumn=81
"Indenting
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set autoindent

set foldmethod=marker

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

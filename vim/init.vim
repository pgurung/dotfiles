set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Auto completion and linting
" Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lsp'
Plug 'Chiel92/vim-autoformat'

"Status Bar
Plug 'itchyny/lightline.vim'

"Utility and quality of life
"========================================

"tpope's corner
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

"Snippets
Plug 'SirVer/ultisnips'

Plug 'jiangmiao/auto-pairs'

"Syntax highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'

"Change the highlight to the color defined
Plug 'ap/vim-css-color'

"Move between windows using C-<hjkl>
Plug 'christoomey/vim-tmux-navigator'
"========================================

"Writing plugins
Plug 'junegunn/goyo.vim'

"Colorscheme
Plug 'chriskempson/base16-vim'

call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

let mapleader = ' '

" Execute macro in q
map Q @q

nmap 0 ^
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

nmap <silent> <leader>t :vsp term://zsh<cr>
"Remap esc to C-\_C-n in terminal mode
tnoremap <Esc> <C-\><C-n>
" Start the terminal in insert mode
au BufEnter term://* startinsert

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_skip_check = 1

"GraphQL syntax highlighting for .prisma files
autocmd BufNewFile,BufRead *.prisma set syntax=graphql

"Tree Style listing for Netrw
let g:netrw_liststyle=3

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
"Neovim LSP Config
"========================================
lua << EOF
local nvim_lsp = require('nvim_lsp')

nvim_lsp.tsserver.setup{}

nvim_lsp.rust_analyzer.setup{}

EOF

set omnifunc=v:lua.vim.lsp.omnifunc
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'max_menu_width', 80)

"========================================
" rustfmt on write using autoformat
" autocmd BufWrite * :Autoformat

"========================================

"UltiSnips snippet files location
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

"FZF config
"========================================
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

" if executable('ag')
"   set grepprg=rg\ --color=never
"   set grepformat=%f:%l:%c%m
" endif

" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = float2nr(10)
"   let width = float2nr(80)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction

nnoremap <c-p> :Files<cr>
nnoremap <leader>g :Rg<Cr>
nnoremap <leader>b :Buffers<Cr>
"========================================

" GO config
"========================================
"Map LEADER-r to run the current file in a vertical split
autocmd FileType go nmap <leader>r :w<CR>:vsp term://go run %<cr>

"Map LEADER-d to debug the current file in a vertical split
autocmd FileType go nmap <leader>d :w<CR>:vsp term://dlv debug %<cr>

"========================================
"
"Python Config
"========================================
"LEADER-r mapping to run the current file in a vertical split
autocmd FileType python nmap <leader>r :w<CR>:vsp term://python3 %<cr>
"
"Writing configuration
"========================================
let g:goyo_width=100
"========================================

"
"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme base16-gruvbox-dark-medium

set colorcolumn=100

"Indenting
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set autoindent

set foldmethod=marker

"Causes graohics issues inside tmux in certain files
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
"set relativenumber

set wildoptions+=pum
set wildoptions+=tagfile
set diffopt+=vertical

"Remove highlight after the search is done
nnoremap <silent> <leader>n :nohlsearch <CR>

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Auto completion and linting
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ } 

Plug 'itchyny/lightline.vim'

"Utility and quality of life  
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'

"Go Plugins
" Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" Themes
Plug 'haishanh/night-owl.vim'

call plug#end()
filetype plugin indent on   

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

let g:python3_host_prog='/usr/local//Cellar/python/3.7.0/bin/python3'

"Ale config
let g:ale_completion_enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {
            \ 'html': [ 'tsserver' ],
            \ }
let g:ale_fixers = {
            \ 'javascript': [ 'eslint' ],
            \ }
let g:ale_linter_aliases = { 'html': ['ts'] }

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save =1

let g:LanguageClient_serverCommands = {
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ }

let g:deoplete#enable_at_startup = 1

" Emmet setup
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" js === jsx
let g:jxs_ext_required = 0


nmap <leader>f <Plug>(ale_fix)

" Use a slightly slimmer error pointer
let g:ale_sign_error = '☓'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚬'
hi ALEWarningSign guifg=#F2C38F

"nnoremap \ :ag<SPACE>
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <c-p> :FZF<cr>


" vim-go config 
let g:go_fmt_command = "goimports"


"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax enable

"Color settings
if (has("termguicolors"))
 set termguicolors
endif

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme night-owl
set background=dark
let g:gruvbox_italic=1


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
"set autowrite

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

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Auto completion and linting
Plug 'w0rp/ale'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ } 

Plug 'itchyny/lightline.vim'

"Utility and quality of life  
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-dirvish'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

"Go Plugins
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'ncm2/ncm2-go'

"Colorscheme
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'

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

"Exit out of normal mode and save
imap <C-s> <esc>:w<cr>

" Cycle through buffers
nnoremap <leader><tab> :bn<CR>

" Ctrl-c copies to system clipboard from visual mode
vnoremap <C-c> "*y

"Remap esc to C-\_C-n in terminal mode
tnoremap <Esc> <C-\><C-n>

let g:python3_host_prog='/usr/local/bin/python3'

"Ale config
let g:ale_completion_enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {
      \ 'html': [ 'tsserver' ],
      \ }
let g:ale_fixers = {
      \ 'javascript': [ 'prettier' ],
      \ 'typescript': [ 'prettier' ],
      \'html':['prettier']
      \ }
let g:ale_linter_aliases = { 'html': ['ts'] }

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save =1

let g:LanguageClient_serverCommands = {
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ }

"ncm-2 config
"enable ncm2 for all buffers
autocmd BufEnter  *  call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

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

let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap <c-p> :Files<cr>
nnoremap <leader>g :Ag<Cr>
nnoremap <leader>b :Buffers<Cr>


" vim-go config 
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-import)

" Quick Scope Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>


"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax enable

let g:one_allow_italics = 1
colorscheme one
set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set updatetime=100

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

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

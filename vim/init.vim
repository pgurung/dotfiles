set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Auto completion and linting
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': ':UpdateRemotePlugins',
      \ } 

Plug 'itchyny/lightline.vim'

"Utility and quality of life  
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'

Plug 'christoomey/vim-tmux-navigator'

"Writing plugins
Plug 'junegunn/goyo.vim'

"Javascript Plugins
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

"Go Plugins
Plug 'fatih/vim-go', {'do':'UpdateRemotePlugins'}
Plug 'zchee/deoplete-go',    { 'do': 'make'}

"Colorscheme
Plug 'joshdick/onedark.vim'

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

" Cycle through buffers
nnoremap <leader><tab> :bn<CR>

" Ctrl-c copies to system clipboard from visual mode
vnoremap <C-c> "*y

"Remap esc to C-\_C-n in terminal mode
tnoremap <Esc> <C-\><C-n>

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_skip_check = 1


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
    else
        let g:NetrwIsOpen=1
        silent Lexplore
        silent vertical resize 40
    endif
endfunction

noremap <silent> <leader>e :call ToggleNetrw()<CR>

"========================================

"Ale config
"========================================
let g:ale_completion_enabled = 0
let g:ale_linters = {
      \ 'html': [ 'tsserver' ],
      \ }
let g:ale_fixers = {
      \ 'javascript': [ 'prettier' ],
      \ 'typescript': [ 'prettier' ],
      \ 'javascript.jsx': [ 'prettier' ],
      \ 'typescript.tsx': [ 'prettier' ],
      \'html':['prettier']
      \ }
let g:ale_linter_aliases = { 'html': ['ts'] }

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save =1

let g:ale_sign_error ="❌" 
let g:ale_sign_warning = "⚠"
nmap <leader>f <Plug>(ale_fix)
"========================================

"Language Client setup
"========================================
let g:LanguageClient_serverCommands = {
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ }
let g:LanguageClient_diagnosticsDisplay= {
      \        1: {
      \      "name": "Error",
      \      "texthl": "ALEError",
      \      "signText": "❌",
      \      "signTexthl": "ALEErrorSign",
      \      "virtualTexthl": "Error",
      \  },
      \}

let g:LanguageClient_useVirtualText = 0

set completefunc=LanguageClient#complete
"========================================

"Deoplete configuration
"========================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1

let g:deoplete#sources = {}
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
      \ 'disabled_syntaxes', ['Comment', 'String'])

call deoplete#custom#source('LanguageClient',
      \ 'min_pattern_length',
      \ 2)

call deoplete#custom#option('sources', {
      \ 'javascript': ['LanguageClient'],
      \ 'typescript': ['LanguageClient'],
      \ 'javascript.jsx': ['LanguageClient'],
      \ 'typescript.tsx': ['LanguageClient'],
      \})

" ignored sources
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

set completeopt+=noselect
set completeopt+=noinsert

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <c-space> <c-x><c-o>
"========================================

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" js === jsx
let g:jsx_ext_required = 0


"FZF config
"========================================
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

nnoremap <c-p> :Files<cr>
nnoremap <leader>g :Ag<Cr>
nnoremap <leader>b :Buffers<Cr>
"========================================

" vim-go config 
"========================================
let g:go_fmt_command = "goimports"
let g:go_snippet_engine="ultisnips"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-import)
"========================================

" Quick Scope Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax on
colorscheme onedark
set background=dark
let g:onedark_terminal_italics=1

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

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
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')

"Fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"Auto completion and linting
Plug 'neoclide/coc.nvim', {'do':{->coc#util#build()}}

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
Plug 'ludovicchabant/vim-gutentags'

"Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"Change the highlight to the color defined
Plug 'ap/vim-css-color'


" Movement Plugins
Plug 'easymotion/vim-easymotion'
"Move between windows using C-<hjkl>
Plug 'christoomey/vim-tmux-navigator'
"========================================

"Writing plugins
Plug 'junegunn/goyo.vim'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

"Colorscheme
Plug 'pgdouyon/vim-yin-yang'
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

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_skip_check = 1

"GraphQL syntax highlighting for .prisma files
autocmd BufNewFile,BufRead *.prisma set syntax=graphql

"Easy motion config
"========================================
"Disable default mapping
let g:EasyMotion_do_mapping = 0 

"`s{char}{char}{label}` to navigate
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"========================================

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
"Tree Style listing for Netrw
let g:netrw_liststyle=3

"COC config
"========================================
"
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

set updatetime=300
set signcolumn=yes

let s:coc_extensions = [
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-emoji',
      \'coc-prettier',
      \'coc-css',
      \'coc-ultisnips'
      \]

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Prettier config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"========================================

"UltiSnips snippet files location
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

"FZF config
"========================================
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

if executable('ag')
  set grepprg=rg\ --color=never
  set grepformat=%f:%l:%c%m
endif

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
let g:goyo_width=80
"========================================

"
"Autoclose preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

syntax on
colorscheme onedark
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

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
"set relativenumber

set diffopt+=vertical

"Remove highlight after the search is done
nnoremap <silent> <leader>n :nohlsearch <CR>

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus','gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

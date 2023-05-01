" Plugins 

call plug#begin()

Plug 'junegunn/vim-easy-align'

Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'rhysd/vim-clang-format'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


" Plugin Config

" Formating 

let g:prettier#autoformat = 1
autocmd BufWritePre,FileWritePre *.{js,jsx,ts,tsx,css,scss,less,json,graphql,md} call prettier#autoformat()

nmap <A-f> :ClangFormat <CR>
let g:clang_format#style = 'Google'

" Auto save 
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

"UI Congig

set updatetime=300
" Enable syntax highlighting
syntax on

" Set the default tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Enable mouse support
    set mouse=a

" Use UTF-8 encoding
set encoding=utf-8

" Enable auto-indentation
    set autoindent

" Enable search highlighting
set hlsearch

" Set a dark color scheme
    colorscheme codedark

" Disable swap file
    set noswapfile

" Disable backup file
    set nobackup
    set nowritebackup

    set lines=36 columns=166

    highlight clear SignColumn
    :set shortmess=
    set guioptions=
    :set noshowmode
    :set nohlsearch
    set completeopt=menuone,noinsert,noselect,preview
    set backspace=2
    set nocompatible
    syntax on
    set modelines=0
    set number
    set encoding=utf-8
    set wrap


"Key Mapping 
" Leader
let mapleader = "<,>" 

" Toggle NERDTree with F2 key

map <F2> :NERDTreeToggle<CR>


" Map Tab and Shift-Tab to navigate placeholders in Coc snippets

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Map Enter to confirm Coc snippet completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

vnoremap <C-c> "+y
vnoremap <C-v> c<ESC>"+p
nnoremap <C-v> "+p

"Terminal command 
nmap <A-t> :terminal<CR> 
nmap <C-x> :q<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Buffer 
nnoremap <C-S-n> :bnext<CR>
nnoremap <C-S-P> :bprev<CR>

"Code Run
autocmd BufEnter *.java let @r=":terminal java %\<CR>"
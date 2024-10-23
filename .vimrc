" Plugins
call plug#begin()
Plug 'github/copilot.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'kshenoy/vim-signature'
Plug 'mileszs/ack.vim'
Plug 'RRethy/vim-illuminate'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'hashivim/vim-terraform'
Plug 'vimwiki/vimwiki'

" FZF configuration
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

" Language specific plugins
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'jelera/vim-javascript-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set backspace=indent,eol,start
let mapleader=','
set hidden
set autoread
set number
set wrap
set signcolumn=yes

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" No backup files
set nobackup
set nowritebackup
set noswapfile

" Performance settings
set updatetime=300
set timeoutlen=500
set lazyredraw
set redrawtime=10000

" UI Configuration
set background=dark
set termguicolors
set guicursor+=a:blinkon400
set lines=62 columns=112
set cmdheight=2
set shortmess+=c
set noshowmode
set laststatus=2
colorscheme wildcharm

" Better command line completion
set wildmenu
set wildmode=list:longest,full
"*****************************************************************************
"" MacVim GUI Settings
"*****************************************************************************
" Remove all GUI elements (scrollbars, toolbar, menu)
set guioptions=

" If you want to be more specific, you can remove individual elements:
set guioptions-=r   " Remove right-hand scrollbar
set guioptions-=R   " Remove right-hand scrollbar when split
set guioptions-=l   " Remove left-hand scrollbar
set guioptions-=L   " Remove left-hand scrollbar when split
set guioptions-=b   " Remove bottom scrollbar
set guioptions-=T   " Remove toolbar
set guioptions-=m   " Remove menu bar
set guioptions-=e   " Use text tab bar, not GUI
set guioptions-=M   " Don't source system menu

" Optional: Adjust window appearance
set linespace=1             " Adjust line spacing

" Disable GUI tab line
set showtabline=1   " Show tab line only if there are at least two tabs

" Optional: If you want to use terminal-style tabs instead of GUI tabs
set guioptions-=e
set stal=2

" Optional: Remove MacVim native full screen transition
set macligatures
set macthinstrokes
"*****************************************************************************
"" Plugin Configuration
"*****************************************************************************
" NERDTree
let g:NERDTreeChDirMode=1
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=40
let g:NERDTreeHijackNetrw=0
let g:NERDTreeQuitOnOpen=1

" Airline
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_skip_empty_sections=1

" Git Gutter
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_max_signs=500

" FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

" Go settings
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1

"*****************************************************************************
"" CoC Configuration
"*****************************************************************************
" Path configuration
let g:coc_node_path = '/opt/homebrew/bin/node'
let g:coc_config_npm_binPath='/opt/homebrew/bin/npm'

" CoC extensions
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-snippets'
    \ ]

" Completion settings
set completeopt=menuone,noinsert,noselect,preview
let g:coc_default_semantic_highlight_groups = 1

" Function to check backspace
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Clear existing mappings
silent! iunmap <TAB>
silent! iunmap <S-TAB>
silent! iunmap <CR>

" Completion mappings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Double tab to confirm completion
inoremap <silent><expr> <TAB><TAB> 
      \ coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" Make CR work normally when no popup is visible
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"*****************************************************************************
"" Key Mappings
"*****************************************************************************
" Window navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>

" Buffer navigation
nnoremap gb :Buffers<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" FZF
nnoremap <silent> <leader>e :FZF -m<CR>
nmap <leader>y :History:<CR>

" Split windows
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"*****************************************************************************
"" Autocommands
"*****************************************************************************
" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Exit Vim if NERDTree is the only window remaining
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"*****************************************************************************
"" CoC Completion Navigation
"*****************************************************************************
" Clear existing completion mappings first
silent! iunmap <TAB>
silent! iunmap <S-TAB>
silent! iunmap <CR>
silent! iunmap <C-j>
silent! iunmap <C-k>
silent! iunmap <Down>
silent! iunmap <Up>

" Navigate completion list with Ctrl-j and Ctrl-k or Up/Down arrows
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"

" Use Tab and Shift-Tab as alternatives
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Select/confirm completion with Enter
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Refresh completion with Ctrl-Space
inoremap <silent><expr> <c-space> coc#refresh()

" Optional: Enable popup menu select mode
" This means you can use Ctrl-n and Ctrl-p as well
set completeopt+=popup

"*****************************************************************************
"" Buffer and Tab Navigation (Mac Optimized)
"*****************************************************************************
" Note: In MacVim, <D> represents Command key (⌘)
" For terminal Vim/Neovim, we'll use Control key as it's more accessible

" Buffer navigation
" List all buffers with FZF
nnoremap <leader>b :Buffers<CR>
" Navigate between buffers using Control + h/l
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
" Close current buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" Save and close buffer
nnoremap <leader>w :w<CR>
nnoremap <leader>x :bd<CR>

" Tab navigation
" Create new tab
nnoremap <silent> <leader>t :tabnew<CR>
" Navigate between tabs using Control + j/k
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
" Use Command + number in MacVim, Control + number in terminal
if has("gui_macvim")
    " MacVim: Use Command (⌘) + number
    nnoremap <D-1> 1gt
    nnoremap <D-2> 2gt
    nnoremap <D-3> 3gt
    nnoremap <D-4> 4gt
    nnoremap <D-5> 5gt
    nnoremap <D-6> 6gt
    nnoremap <D-7> 7gt
    nnoremap <D-8> 8gt
    nnoremap <D-9> 9gt
else
    " Terminal Vim: Use Control + number
    nnoremap <C-1> 1gt
    nnoremap <C-2> 2gt
    nnoremap <C-3> 3gt
    nnoremap <C-4> 4gt
    nnoremap <C-5> 5gt
    nnoremap <C-6> 6gt
    nnoremap <C-7> 7gt
    nnoremap <C-8> 8gt
    nnoremap <C-9> 9gt
endif

" Move tabs (works in both MacVim and terminal)
nnoremap <silent> <C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Quick tab overview with FZF
nnoremap <leader>tb :Windows<CR>

" Close tab
nnoremap <leader>tc :tabclose<CR>

" Window splitting
nnoremap <leader>sh :new<CR>
nnoremap <leader>sv :vnew<CR>

" Window navigation (using Control + arrow keys or hjkl)
" Option 1: Arrow keys
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" Option 2: Vim style keys with Leader
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Resize windows using Shift + arrow keys
nnoremap <S-Up> :resize -2<CR>
nnoremap <S-Down> :resize +2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
nnoremap <S-Left> :vertical resize -2<CR>

" Quick window actions
" Maximize current window
nnoremap <leader>m <C-w>_<C-w><Bar>
" Make windows equal size
nnoremap <leader>= <C-w>=

" FZF integration for better buffer/window management
" Quick access to recent files
nnoremap <leader>r :History<CR>
" Search in current buffer
nnoremap <leader>/ :BLines<CR>
" Search across buffers
nnoremap <leader>L :Lines<CR>

" Optional: Terminal specific settings
if !has("gui_running")
    " Better Control key mappings for terminal
    set ttimeoutlen=10
    " Handle Control combinations better
    set <F13>=^[[25;5~
    map <F13> <C-PageUp>
    set <F14>=^[[26;5~
    map <F14> <C-PageDown>
endif


"*****************************************************************************
"" MacVim Warning Suppression
"*****************************************************************************
" Disable MacVim's Distributed Objects warning messages
if has('gui_macvim')
    set noimd
    " Disable default MacVim key mappings
    let macvim_skip_cmd_opt_movement = 1
    " Disable MacVim's auto IME switching
    let macvim_skip_im_select = 1
    
    " Disable update checks
    let g:macvim_skip_update_check = 1
    
    " Disable default MacVim customizations
    let macvim_use_default_customizations = 0
    
    " Prevent Sparkle update checks
    let g:sparkle_enabled = 0
endif

" Additional performance optimizations for Mac
if has('mac')
    " Improve terminal responsiveness
    set ttyfast
    " Reduce key code delays
    set ttimeoutlen=10
    " Disable mouse reporting when not needed
    set mouse=a
    set ttymouse=xterm2
endif


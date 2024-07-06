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
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'RRethy/vim-illuminate'
Plug 'ternjs/tern_for_vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:coc_node_path = '/opt/homebrew/bin/node'
let g:coc_config_npm_binPath='/opt/homebrew/bin/npm'


nmap <A-f> :ClangFormat <CR>
let g:clang_format#style = 'Google'

"UI Congig
set updatetime=100
" Enable syntax highlighting
syntax on

set background=dark
set guicursor+=a:blinkon400
  " set foldmethod=indent
" " Set the default tab width to 4 spaces
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
colorscheme wildcharm
" Disable swap file
set noswapfile

" Disable backup file
set nobackup
set nowritebackup

set lines=52 columns=150

highlight clear SignColumn
set shortmess=
set guioptions=
set noshowmode
set completeopt=menuone,noinsert,noselect,preview
set backspace=2
set nocompatible
set modelines=0
set number
set encoding=utf-8
set wrap
set nocompatible
set backspace=indent,eol,start
set guifont=Monospace\ 9
"Key Mapping 
" Leader
let mapleader = "," 
" Use preset argument to open it
nmap <space>ed <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>
" Use preset argument to open it
nmap <F2> <Cmd>CocCommand explorer --focus buffer<CR>
nmap <F5> <Cmd>CocCommand explorer <CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

vnoremap <C-c> "+y
vnoremap <C-v> c<ESC>"+p
nnoremap <C-v> "+p

"Terminal command 
nmap <A-t> :terminal<CR> 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"Code Run
autocmd BufEnter *.java let @r=":terminal java %\<CR>"

" Enable line numbers and the signcolumn
set signcolumn=yes
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Define signs for gitgutter plugin
sign define GitGutterAdd text=+ texthl=GitGutterAdd linehl=GitGutterAdd
sign define GitGutterChange text=~ texthl=GitGutterChange linehl=GitGutterChange
sign define GitGutterDelete text=_ texthl=GitGutterDelete linehl=GitGutterDelete
" Map the signs to the corresponding GitGutter symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
" vim-airline settings
let g:airline#extensions#gitgutter#enabled = 1
let g:airline_theme='badwolf'
" fugitive settings
nnoremap <leader>gs :Git<CR>     " Open Git status with <leader>gs
" default updatetime 4000ms is not good for async update
set updatetime=100
" Map F2 to search for files and F3 to search for text within files
nnoremap <F2> :FZFFiles<CR>
nnoremap <F3> :FZFText<CR>
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
" Use <Tab> for trigger completion and navigate between suggestions
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <CR> to confirm completion, as well as make selections from the pop-up menu
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Enable syntax highlighting


nmap    <space>f <Plug>CtrlSFPrompt
vmap    <C-F>f <Plug>CtrlSFVwordPath
vmap    <C-F>F <Plug>CtrlSFVwordExec
nmap    <C-F>n <Plug>CtrlSFCwordPath
nmap    <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <space>t :CtrlSFToggle<CR>

inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


let g:ctrlsf_backend='ag'
let g:Illuminate_ftblacklist = ['nerdtree']

augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
augroup END

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


nnoremap <C-S-F> :grep <C-R>=expand('<cword>')<CR> ./*<CR>

syntax enable
set background=dark

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1




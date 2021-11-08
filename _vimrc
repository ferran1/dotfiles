syntax on
"colorscheme pixelmuerto
"colorscheme iceberg
colorscheme anderson

call plug#begin('~/vimfiles/plugged')
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/AutoComplPop'
Plug 'preservim/nerdcommenter'
Plug 'neomake/neomake'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'chrisbra/Colorizer'
Plug 'szw/vim-maximizer'
Plug 'justinmk/vim-sneak'
Plug 'markonm/traces.vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
"Additional two libs needed for snipmate
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
call plug#end()

set autoread
call plug#end()

set backspace=2
set laststatus=2 "Always show the statusbar
set clipboard=unnamed
set nu
set relativenumber "Turn on line numbering

"Hide the menu bar:
set guioptions -=m

"Set tabbar to text mode
set guioptions -=e

"Hide the tool bar:
set guioptions -=T

set guioptions +=d

"Correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Settings for AutoComplPop
set complete+=kspell "Makes sure difficult words can get autocompleted when typing ctrl + p in insert mode"
set completeopt=menuone,longest
set shortmess+=c

" enable 256 colors
"set t_Co=256

" Switch between case sensitive and insensitive automatically during search
set smartcase

" Automatically change directory
set autochdir

set encoding=utf-8
set fileencoding=utf-8

set nocompatible

"Sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
"
" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

"Set filetype for python
autocmd BufNewFile,BufRead *.py set ft=python

filetype on
filetype plugin indent on
setlocal nowrap

" code folding
set foldmethod=indent
set foldlevel=99

autocmd VimEnter * NERDTree

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Coc extensions
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-pairs',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-pyright',
			\ 'coc-stylelint',
			\ 'coc-markdownlint',
			\ 'coc-html',
\ ]

" Git gutter config (Plugin that shows git diff in side column)
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

"Tagbar Settings
nmap <f8> :TagbarToggle<CR>

" Fugitive vim remaps
nmap <leader>gs :G<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" NERDTree vim remaps
nmap <F6> :NERDTreeToggle<CR>

" Switch between splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"gg ale plugin (linters)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

nmap <C-e> <Plug>(ale_next_wrap)
nmap <C-r> <Plug>(ale_previous_wrap)

"Neomake (Synax checker) Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

"Open the Neomake list (The list that shows up when there are errors in a file) automatically
let g:neomake_open_list = 2

"ctrlp vim (search for files) settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Open Nerdtree and startify correctly at the same time when starting vim
autocmd VimEnter *
\ if !argc()
\ | Startify
\ | wincmd o
\ | NERDTree
\ | wincmd w
\ | endif

"vim jinja config
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"Automatic load Colorizer for HTML and CSS files
:let g:colorizer_auto_filetype='css,html'

"Snip mate config
let g:snipMate = { 'snippet_version' : 1 }

"Vim sneak
let g:sneak#label = 1

" ---- vim-closetag plugin config ----
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

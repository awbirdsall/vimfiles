set nocompatible "use vim not vi
" plugins: start vundle section
" Set up filetype for loading plugins wtih vundle:
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~\vimfiles\bundle\Vundle.vim\
let path='~\vimfiles\bundle'
call vundle#begin(path)

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" language-specific
" use for markdown folding -- requires python for full features
Plugin 'vim-pandoc/vim-pandoc'
" lightweight latex -- latexmk doesn't seem to have windows compatibility
Plugin 'lervag/vim-latex'
" pandoc syntax -- makes markdown look nice
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Display
" distraction-free mode
Plugin 'mikewest/vimroom'

" Themes
" solarized color scheme
Plugin 'altercation/vim-colors-solarized'
" Theme manager
Plugin 'reedes/vim-thematic'
" color scheme with writing in mind
Plugin 'reedes/vim-colors-pencil'

" Run Git commands within vim, integrate buffer
Plugin 'vim-scripts/fugitive.vim'

" Extend vim commands
" Add some new verbs for swapping lines, etc.
Plugin 'tpope/vim-unimpaired'
" mappings for working with surrounding parens, quotes, etc.
Plugin 'tpope/vim-surround'
" add gc as comment verb
Plugin 'tpope/vim-commentary'
" can use . to repeat plugin mappings
Plugin 'tpope/vim-repeat'

" Make wiki-type files in vim
Plugin 'vimwiki'

" motion plugin with s and c
Plugin 'justinmk/vim-sneak'

" tabs and tables
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'

" currently unused
" snippets
" Plugin 'SirVer/ultisnips'
" two-way ipython and vim interactions
" Plugin 'ivanov/vim-ipython'
" latex suite
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" enhance netrw
" Plugin 'tpope/vim-vinegar'
" fuzzy finding
" Plugin 'kien/ctrlp.vim'
" search with ack
" Plugin 'mileszs/ack.vim'
" Pretty up status bar
" Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Themes -- set up solarized
syntax enable
set background=dark
colorscheme solarized

"General
set shellslash "backslashes for windows. Required for vim-latex.
set modelines=0 " no modelines
set scrolloff=3 "start scrolling near top or bottom
set backspace=indent,eol,start "can backspace anything, INS mode
set history=1000 "lotsa command line history

"ultiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" vimwiki settings
" use vimwiki as folder in Dropbox
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
" folding in vimwiki:
let g:vimwiki_folding='expr'

" vimroom settings:
let g:vimroom_sidebar_height=0
" File saving and buffers
set autoread " autoupdate files edited outside vim
"au FocusLost * :wa "autosave on lost focus
set hidden " background buffers persist
set undofile "make undofile---maybe should have some sort of version check?

" Tab format - replace with spaces, 4 space indents
set autoindent " use indent from previous line
set cindent " supposed to be better for python comments than smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Appearance
set colorcolumn=+1 " relative to textwidth. Not used with textwidth=0.
set wrap "wrap lines longer than window width in display
set showmatch "blink on matching bracket
" set visualbell "flash display when compy would beep
set cursorline "highlight entire line with cursor
set ttyfast " more characters for redraws
set ruler " not sure if this matters with airline
set relativenumber "ruler numbers relative to cursor, for j, etc.
set laststatus=2 "always show status line for last window
set showmode "show mode at bottom left
set showcmd "show partial command at bottom right

"Command line completion
set wildmenu "enhanced command line completion
set wildmode=longest:full "complete longest common string, start wildmenu
set wildignore+=*.pyc " ignore compiled .pyc files
set wildignorecase "case-insensitive when completing file names

" Searching
 "default to very magic search---assume all special chars:
nnoremap / /\v
vnoremap / /\v
set ignorecase "ignore case for lowercase search
set smartcase "case-sensitive when uppercase used
set gdefault "default to substitute all in line. g toggles to sub one
set incsearch "jump to pattern midway through search
set hlsearch "highlight search results
" turn off highlight:
nnoremap <leader><space> :noh<cr>

" Text formatting
set textwidth=79 "maximum true width of text in buffer
" Formatting done by 'gq':
set formatoptions+=qrn1
" q: gq can format comments
" r: INS Enter inserts current comment leader
" n: recognize numbered list and autoindent
" 1: break line before one-letter word instead after, if possible
" set formatoptions-=tc
" t: auto-wrap text using textwidth
" c: auto-wrap comments using textwidth, auto-insert comment leader
set encoding=utf-8

" Remaps (can't comment at end of these lines!)
" Return to normal mode from INS without ESC leap:
inoremap jj <ESC>
"jump to (, etc., match with TAB:
" nnoremap <tab> %
" vnoremap <tab> %
" refresh vimrc with leader rr:
map <leader>rr :source ~\vimfiles\vimrc
map <leader>re :edit ~\vimfiles\vimrc

" macros
" add markdown link to visual mode selection:
let @l = 'S]%a(*)'

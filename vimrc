set nocompatible "use vim not vi
" plugins: start vundle section
" Set up filetype for loading plugins wtih vundle:
filetype off

" set the runtime path to include Vundle and initialize
if has('win32')
    set rtp+=~\vimfiles\bundle\Vundle.vim\
    let path='~\vimfiles\bundle'
    call vundle#begin(path)
endif
if has('unix')
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

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
" dracula color theme
Plugin 'dracula/vim'
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

" syntax checking
Plugin 'vim-syntastic/syntastic'

" fuzzy finding
Plugin 'ctrlpvim/ctrlp.vim'

" enhance netrw
Plugin 'tpope/vim-vinegar'

" syntax highlighting for racket/pollen
Plugin 'wlangstroth/vim-racket'
Plugin 'otherjoel/vim-pollen'

" currently unused
" snippets
" Plugin 'SirVer/ultisnips'
" two-way ipython and vim interactions
" Plugin 'ivanov/vim-ipython'
" latex suite
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
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

" seems to help keep things from getting really crashy when python is invoked
" see https://stackoverflow.com/a/35620795/4280216
let $PYTHONPATH = "C:\\miniconda3\\Lib;C:\\miniconda3\\DLLs;C:\\miniconda3\\Lib\\lib-tk;C:\\miniconda3"

" syntastic syntax checking
" syntastic suggests adding to status line, but it wipes out default display :(
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set syntastic to passive mode by default, otherwise it will run on every save
" can always use :SyntasticCheck for manual check, or :SyntasticToggleMode
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
" always use loc_list, don't know any conflicts with other plugins
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" when in active mode, check on open but not :wq
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Use pylint for python
let g:syntastic_python_checkers = ['pylint']

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

" Recognize *.md as Markdown by default (not modula2)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
augroup vimrc
    " first remove all vimrc autocommands (avoid issues when sourced twice)
    autocmd!
    " use vim-pandoc-syntax without vim-pandoc
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

	" vim-pollen settings
	" Set Pollen syntax for files with these extensions:
    au! BufRead,BufNewFile *.pm set filetype=pollen
    au! BufRead,BufNewFile *.pp set filetype=pollen
    au! BufRead,BufNewFile *.ptree set filetype=pollen
    " Suggested editor settings:
    autocmd FileType pollen setlocal wrap      " Soft wrap (don't affect buffer)
    autocmd FileType pollen setlocal linebreak " Wrap on word-breaks only
    " remap j/k in pollen buffers to gj/gk
    autocmd FileType pollen noremap <buffer> j gj
    autocmd FileType pollen noremap <buffer> k gk

augroup END

" Set 

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
set ruler
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
set formatoptions+=qn1
" q: gq can format comments
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
if has('win32')
    map <leader>rr :source ~\vimfiles\vimrc
    map <leader>re :edit ~\vimfiles\vimrc
endif
if has('unix')
    map <leader>rr :source ~/.vimrc
    map <leader>re :edit ~/.vimrc
endif

" macros
" add markdown link to visual mode selection from external clipboard
let @l = 'S]%a(*)'
" add pollen linky link to visual mode selection from external clipboard
let @k = 'S}iLZlinky["*"]'


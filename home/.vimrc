set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'
Bundle 'klen/python-mode'

" Disable linting every save
let g:pymode_lint_write = 0


filetype plugin indent on
filetype plugin on 
filetype on
au VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif
nmap ,l :set list!
set pastetoggle=<F2>
set expandtab
set tabstop=4 
set backspace=indent,eol,start 
set number
nmap <silent> ,/ :nohlsearch<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk
syntax on
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set history=1000       
set undolevels=1000   
set wildignore=*.swp,*.bak,*.pyc,*.class

set noerrorbells     

set nobackup
set noswapfile
set wrapscan
set wrap

set wrap
set linebreak
set textwidth=0
set wrapmargin=0

colorscheme seoul 

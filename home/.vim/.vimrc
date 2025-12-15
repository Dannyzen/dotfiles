filetype plugin on
    
call plug#begin('~/.vim/plugged')

" Plugins
" Modern Basics
Plug 'https://www.github.com/tpope/vim-commentary'      " Lightweight comments
Plug 'https://www.github.com/itchyny/lightline.vim'     " Fast status line
Plug 'https://www.github.com/lambdalisue/fern.vim'      " Async file explorer

" Coding
Plug 'https://www.github.com/tmsvg/pear-tree'           " Auto-pairs
Plug 'https://www.github.com/edkolev/promptline.vim'
Plug 'https://www.github.com/wellle/targets.vim'
Plug 'https://www.github.com/jmcantrell/vim-virtualenv'
Plug 'https://www.github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Lightline config
let g:lightline = { 'colorscheme': 'wombat' }

" Disable linting every save
let g:pymode_lint_write = 0
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'


filetype plugin indent on
filetype on
au VimLeave * if filereadable(".vim/.netrwhist")|call delete(".vim/.netrwhist")|endif
nmap ,l :set list!
set pastetoggle=<F2>
set expandtab
set tabstop=2 
set backspace=indent,eol,start 
set number
nmap <silent> ,/ :nohlsearch<CR>
nnoremap ; :
nnoremap j gj
nnoremap k gk
syntax on
set shiftwidth=2
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

" Fern (Sidebar) map to leader z
map <silent> <leader>z :Fern . -drawer -reveal=%<CR>

" :Gorun to leader ("\") to "\\r"
map <silent> <leader>r :GoRun<CR>

set laststatus=2
set t_Co=256

" Experiment
set t_ti= t_te=

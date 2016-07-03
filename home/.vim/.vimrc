filetype plugin on

set rtp+=$DOTFILES/vundle/
call vundle#rc()


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
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'edkolev/promptline.vim'
Bundle 'wellle/targets.vim'

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

" Nerdtree map to leader z
map <silent> <leader>z :NERDTree<CR>

set laststatus=2
set t_Co=256

" Experimental, lets see if i like it
:inoremap <silent> <Esc> <Esc>`^

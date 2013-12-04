" esoergel's .vimrc

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" http://www.reddit.com/r/vim/comments/1424b3/what_do_you_need_mostfirst_when_starting_in_a_new/

" Plugins
" =======
" To check out:
" Bundle 'vim-unimpaired'
" Bundle 'vim-fuzzyfinder'
" command T
" Bundle 'scrooloose/syntastic'

Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-sensible'
Bundle 'groenewege/vim-less'

Bundle 'rking/ag.vim'

Bundle 'davidhalter/jedi-vim'
" Don't popup docstring window
autocmd FileType python setlocal completeopt-=preview

Bundle 'kien/ctrlp.vim'
let g:ctrlp_root_markers=['.git/']

Bundle 'scrooloose/nerdcommenter'
let NERDCommentWholeLinesInVMode=1
let g:NERDCustomDelimiters = {
    \ 'vim': { 'left': '" '},
    \ 'python': { 'left': '# '},
    \ 'html': {
      \ 'left': '<!-- ', 'right': ' -->',
      \ 'leftAlt': '{# ', 'rightAlt': ' #}',
      \ },
    \ 'javascript': { 'left': '// '},
  \ }

Bundle 'scrooloose/nerdtree'
" Auto close NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=[
    \ '\~$',
    \ '\.pyc$',
    \ ]

" Sublime Text style multiple selection
Bundle 'terryma/vim-multiple-cursors'

" Auto-detect indentation
Bundle 'tpope/vim-sleuth'

" Color Scheme
Bundle 'junegunn/seoul256.vim'
let g:seoul256_background = 233
colo seoul256


"
" Bundle commands
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Mappings
" ========
map <leader>v :vsplit<CR>
map <leader>s :split<CR>
map <leader>a :Ag 
map <leader>b :CtrlPBuffer<CR>

map <leader>ww :wincmd w<CR>
map <leader>wh :wincmd h<CR>
map <leader>wj :wincmd j<CR>
map <leader>wk :wincmd k<CR>
map <leader>wl :wincmd l<CR>


" Settings
" ========
if has('mouse')
  set mouse=a
endif

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
set showbreak=>>>
set linebreak
set autoread               " Read any changes on disk if not altered in vim

set whichwrap+=<,>,h,l,[,]
set hlsearch               " highlight searches
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set showcmd

" set t_Co=256               " enable 256-color mode.
" colorscheme desert         " set colorscheme

" set fileformats+=dos       " don't auto-add an eol character

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set backupskip=/tmp/

set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.DS_Store
set wildignore+=*.pyc

" Hide buffers instead of closing them
" set hidden

set showmode

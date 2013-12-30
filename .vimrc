" esoergel's .vimrc

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" http://www.reddit.com/r/vim/comments/1424b3/what_do_you_need_mostfirst_when_starting_in_a_new/

" PLUGINS
" =======
" To check out:
" Bundle 'vim-unimpaired'
" Bundle 'vim-fuzzyfinder'
" command T
" Bundle 'scrooloose/syntastic'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'


" EDITING
Bundle 'tpope/vim-surround'
Bundle 'Gundo'
    let g:gundo_width = 40
    let g:gundo_preview_height = 40
    let g:gundo_right = 0
Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"

" Auto-detect indentation
Bundle 'tpope/vim-sleuth'
Bundle 'scrooloose/nerdcommenter'
    let NERDCommentWholeLinesInVMode=1
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1
    let g:NERDCustomDelimiters = {
        \ 'html': {
          \ 'leftAlt': '{# ', 'rightAlt': ' #}',
          \ }
      \ }


" CODE
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
" Bundle 'davidhalter/jedi-vim'
" Don't popup docstring window
" autocmd FileType python setlocal completeopt-=preview


" NAVIGATION
Bundle 'rking/ag.vim'
" Sublime Text style multiple selection
Bundle 'terryma/vim-multiple-cursors'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-vinegar'
" Bundle 'scrooloose/nerdtree'
    " " Auto close NERDTree
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    " let NERDTreeIgnore=[
        " \ '\~$',
        " \ '\.pyc$',
        " \ ]
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_root_markers=['.git/']
Bundle 'Lokaltog/vim-easymotion'


" COLOR SCHEME
" Bundle 'altercation/vim-colors-solarized'
Bundle 'junegunn/seoul256.vim'
    let g:seoul256_background = 233
    colo seoul256


" GIT
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'


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
let mapleader=" "

map <leader>v :vsplit<CR>
map <leader>s :split<CR>
map <leader>w <C-w>
map <leader>* oprint "*"*40<Esc>
map <leader>D Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>d oimport ipdb; ipdb.set_trace()<Esc>
map <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

map <leader>a :Ag 
map <leader>b :CtrlPBuffer<CR>
map <leader>p :CtrlP<CR>
map <leader>t :CtrlPTag<CR>
map <leader>u :GundoToggle<CR>
map <leader>/ <leader>c 

map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff 
" nnoremap <silent> <Esc> :noh<CR><Esc><Esc>

" Use ranger as vim file manager
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction

nmap <leader>r :call Ranger()<cr>



" Holy shit, this is possible??
" <Leader>0: Run the visually selected code in python and replace it with the
" output
vnoremap <silent> <Leader>0 :!python<cr>

" Settings
" ========
if has('mouse')
    set mouse=a
endif

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
" http://jrgraphix.net/r/Unicode/2900-297Fhttp://jrgraphix.net/r/Unicode/2900-297Fhttp://jrgraphix.net/r/Unicode/2900-297Fhttp://jrgraphix.net/r/Unicode/2900-297Fhttp://jrgraphix.net/r/Unicode/2900-297F
" http://jrgraphix.net/r/Unicode/2900-297F
" ⤇ → ⤘ ⥹ ⥤ ⤷
set showbreak=⤇\  
" set showbreak=>>>
set linebreak
set autoread               " Read any changes on disk if not altered in vim

set whichwrap+=<,>,h,l,[,]
set hlsearch               " highlight searches
" set nohlsearch             " Don't continue to highlight searched phrases.
" temporarily turn off highlight with \
nnoremap \ :noh<CR>
" map <leader>/ :noh<CR>
set incsearch              " start looking for search matches while typing
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

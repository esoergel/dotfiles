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

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'


" EDITING
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
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
Bundle 'scrooloose/syntastic'
    let g:syntastic_python_checkers=['python']
    let g:syntastic_haskell_checkers=['ghc_mod']
    " let g:syntastic_python_checkers=['pylint']
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
    let g:tagbar_sort = 0
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
Bundle 'chrisbra/NrrwRgn'
    let g:nrrw_rgn_vert = 1


" UI
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'junegunn/seoul256.vim'
    let g:seoul256_background = 233

set t_Co=256               " enable 256-color mode.
" set background=light
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme desert
colorscheme seoul256
" colorscheme seoul256-light
" colorscheme elflord



" GIT
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mmozuras/vim-github-comment'
Bundle 'mattn/webapi-vim.git'
    let g:github_user = 'esoergel'


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
let mapleader="\<Space>"

" obj.value -> obj['value']
nnoremap <leader>] ea']<Esc>3bxi['<Esc>
" nnoremap <leader>] "gdiwxa['']<Esc>h"gP

" copy-paste to/from register
map <leader>% :source %<CR>

" try out prefixing these
map <leader>* oprint "*"*40, 'ESOE: <c-o>p', "*"*40<Esc>
map <leader>db oimport ipdb; ipdb.set_trace()<Esc>
map <leader>Db Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>
" with c:
map <leader>c* oprint "*"*40, 'ESOE: <c-o>p', "*"*40<Esc>
map <leader>cd oimport ipdb; ipdb.set_trace()<Esc>
map <leader>cD Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>co :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>cO :set paste<CR>m`O<Esc>``:set nopaste<CR>

map <leader>/ <leader>c 
map <leader>a :Ag 
map <leader>b :CtrlPBuffer<CR>
map <leader>e :Tagbar<CR>

" git and diff stuff
map <leader>d2 :diffget //2 <bar> diffupdate<CR>
map <leader>d3 :diffget //3 <bar> diffupdate<CR>
map <leader>dg :diffget <bar> diffupdate<CR>
map <leader>dp :diffput <bar> diffupdate<CR>
map <leader>du :diffupdate<CR>
map <leader>gb :Gblame<CR>
map <leader>gc :GHComment 
map <leader>gd :Gdiff 
map <leader>gs :Gstatus<CR>:resize +10<CR>
map <leader>gw :Gwrite<CR>

map <leader>p "vp
map <leader>P "vP
map <leader>o :CtrlP<CR>
" consider moving split and vsplit to <leader>ws (and wv)
map <leader>s :split<CR>
map <leader>t :CtrlPTag<CR>
map <leader>u :GundoToggle<CR>
map <leader>v :vsplit<CR>
map <leader>w <C-w>
map <leader>W :%s/\s\+$//
map <leader>x :syntax on<CR>:source ~/.vimrc<CR>
map <leader>y "vy
" nnoremap <silent> <Esc> :noh<CR><Esc><Esc>

" remove annoying commands
nnoremap q: <Nop>
nnoremap Q <Nop>

vnoremap <silent> <Leader>0 :!python<cr>


" Syntax
" ======
" au BufReadPost SCons* set syntax=python
" au BufReadPost Cons* set syntax=perl
" au BufReadPost *.mke set syntax=make
" au BufReadPost make*.inc set syntax=make
" au BufReadPost *.fcc set syntax=cpp
" au BufReadPost *.fhh set syntax=cpp


" Settings
" ========

" Show trailing whitespace
set list listchars=tab:»·,trail:·
" Hide them with leader s
" nmap <silent> <leader>s :set nolist!<CR>

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

set hlsearch
nnoremap <silent> \ :noh<CR>
set incsearch              " start looking for search matches while typing
set showcmd

" Tab options
set tabstop=4                   "A tab is 4 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs

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
set nowrap

noh

" ==============
" Custom Scripts
" ==============

" Use ranger as vim file manager
" ==============================
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


" Append alphanumeric string
" ==========================
" `:RandString 30` appends 30 chars to your current line
function! RandString(n)
python << EOF
import vim, random, string
n = vim.eval("a:n")
randstring = ''.join(
    random.choice(string.lowercase+string.digits*2) for i in
    range(int(n))
)
print randstring
vim.current.line = vim.current.line + randstring
EOF
endfunction
command! -nargs=1 RandString call RandString(<args>)


" Replace selection with random chars
" ===================================
function! RandReplace()
python << EOF
import vim, random, string
buf = vim.current.buffer
(line1, col1) = buf.mark('<')
(line2, col2) = buf.mark('>')
lines = vim.eval('getline({0}, {1})'.format(line1, line2))
getrand = lambda: random.choice(string.lowercase+string.digits*2)
def process_line(line, num):
    # Version 1
    start = col1 if num == 0 else 0
    end = col2 if num == (line2-line1) else 1000
    outline = ''
    for i, char in enumerate(line):
        if start <= i <= end:
            outline += getrand()
        else:
            outline += char
    return outline

    # Version 2
    start = col1 if num == 0 else 0
    end = col2 if num == (line2-line1) else 1000
    return ''.join([
        getrand() if (start <= i <= end) else char
        for i, char in enumerate(line)
    ])

for i, line in enumerate(lines):
    buf[line1+i-1] = process_line(line, i)
EOF
endfunction
vnoremap <Leader>r :call RandReplace()<cr>



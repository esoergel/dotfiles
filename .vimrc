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
    let g:syntastic_haskell_ghc_mod_exec = '~/.cabal/bin/ghc-mod'
    " let g:syntastic_python_checkers=['pylint']
" Bundle 'kovisoft/slimv'
    " let g:slimv_lisp = '/usr/local/bin/scheme'
    " let g:scheme_builtin_swank = 1
    " let g:slimv_impl = 'imit'
Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'
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
    let g:solarized_termcolors=256
Bundle 'junegunn/seoul256.vim'
    let g:seoul256_background = 233
Bundle 'morhetz/gruvbox'
    if !has("gui_running")
        let g:gruvbox_italic=0
    endif
Bundle 'chriskempson/base16-vim'
    let base16colorspace=256

" set background=light
set background=dark
" colorscheme solarized
" colorscheme desert
" colorscheme gruvbox
colorscheme seoul256
" if has("gui_running")
    " colorscheme base16-tomorrow
" endif
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
map <leader>cp oimport json; print json.dumps(<c-o>p, indent=4)<Esc>
map <leader>cd oimport ipdb; ipdb.set_trace()<Esc>
map <leader>cD Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>co :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>cO :set paste<CR>m`O<Esc>``:set nopaste<CR>
iabbrev pdb import ipdb; ipdb.set_trace()
iabbrev ppj import json; print json.dumps(, indent=4)

map <leader>/ <leader>c<space>
map <leader>a :Ag<space>
map <leader>b :CtrlPBuffer<CR>
map <leader>e :Tagbar<CR>

nnoremap <leader>fp 0f(a<CR><Esc>k0f(%i<CR><Esc>kV:s/, /,\r/g<CR>vib=k$%<<
map <leader>ft vab:s/[(,]/\0\r/g<CR>`[V`]=/)<CR>i<CR><ESC><<

" git and diff stuff
map <leader>d2 :diffget //2 <bar> diffupdate<CR>
map <leader>d3 :diffget //3 <bar> diffupdate<CR>
map <leader>dg :diffget <bar> diffupdate<CR>
map <leader>dp :diffput <bar> diffupdate<CR>
map <leader>du :diffupdate<CR>
map <leader>gb :Gblame<CR>
map <leader>gc :Gcommit<CR>
map <leader>gh :GHComment<space>
map <leader>gd :Gdiff<space>
map <leader>gs :Gstatus<CR>:resize +10<CR>
map <leader>gw :Gwrite<CR>

map <leader>p "vp
map <leader>P "vP
map <leader>o :CtrlP<CR>
" consider moving split and vsplit to <leader>ws (and wv)
map <leader>s :w<CR>
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
" set nolist

if has('mouse')
    set mouse=a
endif

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
set autoread               " Read any changes on disk if not altered in vim

set whichwrap+=<,>,h,l,[,]

set hlsearch
nnoremap <silent> \ :noh<CR>
set incsearch              " start looking for search matches while typing
set showcmd

" Tab options
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs
set tabstop=4                   "A tab is 4 spaces

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
set wrap
" requires the breakindent patch
set breakindent
" http://jrgraphix.net/r/Unicode/2900-297F
" ⤇ → ⤘ ⥹ ⥤ ⤷
set showbreak=⤇<\  
set showbreak=⤷\  
set linebreak

" auto indent xml files with '='
" http://ku1ik.com/2011/09/08/formatting-xml-in-vim-with-indent-command.html
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" save view on files - folding, etc..
autocmd BufWrite * mkview
autocmd BufRead * silent loadview

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


" Wrap multi-line comment
" =======================
" Check out python's stdlib textwrap.  In particular fill and wrap.
function! WrapComment()
python << EOF
import vim
from itertools import takewhile
print "*"*40, 'ESOE: WrapComment', "*"*40
LINE_MAX = 40
buf = vim.current.buffer
# selection = vim.current.range
(line1, _) = buf.mark('<')
(line2, _) = buf.mark('>')
lines = vim.eval('getline({0}, {1})'.format(line1, line2))
prefix = ''.join(takewhile(lambda char: char in ' #', lines[0]))
text = ' '.join([line.lstrip(' #').strip() for line in lines])
lines = [[prefix]]
# length = lambda line: sum(map(len, line)) + min(0, len(line)-1)
def length(line, word):
    tmp = sum(map(len, line+[word])) + len(line) - 1
    return tmp
for word in text.split():
    if length(lines[-1], word) < LINE_MAX:
        lines[-1].append(word)
    else:
        lines.append([prefix, word])
def join_line(line):
    return ' '.join([line[0] + line[1]] + line[1:])
    # print '\n'.join([' '.join([line[0] + line[1]] + line[2:]) for line in lines])
print buf[line1-1:line2-1]
print [' '.join([line[0] + line[1]] + line[2:]) for line in lines]
if buf[line1-1:line2-1] != [' '.join([line[0] + line[1]] + line[2:]) for line in lines]:
    del buf[line1-1:line2-1]
    buf.append([' '.join([line[0] + line[1]] + line[2:]) for line in lines], line1)

# print '\n'.join(lines)
# r = buf.range(line1-1, line2-1)
# print r
# buf.append(lines)
EOF
endfunction


fun! GetRange()
python << EOF

import vim

buf = vim.current.buffer
(lnum1, col1) = buf.mark('<')
(lnum2, col2) = buf.mark('>')
lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
lines[0] = lines[0][col1:]
lines[-1] = lines[-1][:col2]
print "\n".join(lines)

EOF
endfun

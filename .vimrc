" esoergel's .vimrc

set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" http://www.reddit.com/r/vim/comments/1424b3/what_do_you_need_mostfirst_when_starting_in_a_new/

" PLUGINS
" =======
" To check out:
Bundle 'tpope/vim-unimpaired'
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
" Bundle 'Raimondi/delimitMate'
" Bundle 'vim-scripts/paredit.vim'
Bundle 'haya14busa/incsearch.vim'
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

" Auto-detect indentation
Bundle 'tpope/vim-sleuth'
Bundle 'scrooloose/nerdcommenter'
    let NERDCommentWholeLinesInVMode=1
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1
    let g:NERDCustomDelimiters = {
        \ 'html': {
          \ 'leftAlt': '{# ', 'rightAlt': ' #}',
          \ },
        \ 'lisp': { 'left': ';;'},
      \ }


" CODE
Bundle 'scrooloose/syntastic'
    let g:syntastic_python_checkers=['python']
    let g:syntastic_haskell_checkers=['ghc_mod']
    " let g:syntastic_haskell_ghc_mod_exec = '~/.cabal/bin/ghc-mod'
    " let g:syntastic_python_checkers=['pylint']
    let g:syntastic_javascript_checkers=['jshint']
" Bundle 'kovisoft/slimv'
    " let g:slimv_lisp = '/usr/local/bin/scheme'
    " let g:scheme_builtin_swank = 1
    " let g:slimv_impl = 'imit'
" Bundle 'hynek/vim-python-pep8-indent'
Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'
Bundle 'groenewege/vim-less'
Bundle 'fs111/pydoc.vim'
" Bundle 'davidhalter/jedi-vim'
" Don't popup docstring window
autocmd FileType python setlocal completeopt-=preview
" Bundle 'vim-pandoc/vim-pandoc'
" Bundle 'vim-pandoc/vim-pandoc-syntax'
    " let g:pandoc#modules#disabled = ["folding"]
    " let g:pandoc#syntax#conceal#use = 0

Bundle 'klen/python-mode'
    let g:pymode_lint = 1
    " let g:pymode_lint_on_write = 0
    " let g:pymode_lint_ignore = ""
    let g:pymode_lint_message = 1
    let g:pymode_lint_cwindow = 0
    let g:pymode_rope_rename_bind = "<leader>cr"
    let g:pymode_options_max_line_length = 80
    let g:pymode_folding = 0
    let g:pymode_doc = 0
    let g:pymode_doc_bind = 'K'
    let g:pymode_trim_whitespaces = 0
    let g:pymode_breakpoint = 0
    let g:pymode_breakpoint_bind = '<leader>dldb'


" NAVIGATION
Bundle 'rking/ag.vim'
  let g:agprg="ag --column --smart-case"
  let g:aghighlight=1
" Sublime Text style multiple selection
Bundle 'terryma/vim-multiple-cursors'
Bundle 'majutsushi/tagbar'
    let g:tagbar_sort = 0
Bundle 'tagexplorer.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'scrooloose/nerdtree'
    " Auto close NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    let NERDTreeIgnore=[
        \ '\~$',
        \ '\.pyc$',
        \ ]
    let g:NERDTreeMapUpdirKeepOpen = "-"
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_root_markers=['.git/']
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chrisbra/NrrwRgn'
    let g:nrrw_rgn_vert = 1
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'h1mesuke/unite-outline'
    let g:unite_winheight=12


" UI
Bundle 'CSApprox'
" Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
    let g:solarized_termcolors=256
Bundle 'junegunn/seoul256.vim'
    let g:seoul256_background = 213
Bundle 'morhetz/gruvbox'
    if !has("gui_running")
        let g:gruvbox_italic=0
    endif
Bundle 'chriskempson/base16-vim'
    let base16colorspace=256
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'osyo-manga/vim-brightest'

" Eigengrau is #16161D, (22, 22, 29)
" (http://en.wikipedia.org/w/index.php?title=Eigengrau&oldid=561213458)
" set background=light
set background=dark
" colorscheme solarized
" colorscheme desert
" colorscheme gruvbox
colorscheme seoul256
" if has("gui_running")
" colorscheme Tomorrow-Night-Eighties
" endif
" colorscheme seoul256-light
" colorscheme elflord



" GIT
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mmozuras/vim-github-comment'
Bundle 'mattn/gist-vim'
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
map <leader>* oprint "*"*40, 'ESOE: <c-o>P', "*"*40<Esc>
map <leader>db oimport ipdb; ipdb.set_trace()<Esc>
map <leader>Db Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>dc ofrom celery.contrib import rdb; rdb.set_trace()<Esc>
nnoremap go :set paste<CR>m`o<Esc>``:set nopaste<CR>
" use ]<space> and [<space> from vim-unimpaired
" map <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
" map <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>
" with c:
map <leader>c* oprint "*"*40, 'ESOE: <c-o>P', "*"*40<Esc>
map <leader>cp oimport json; print json.dumps(<c-o>p, indent=4)<Esc>
map <leader>cd oimport ipdb; ipdb.set_trace()<Esc>
map <leader>cD Oimport ipdb; ipdb.set_trace()<Esc>
map <leader>co :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>cO :set paste<CR>m`O<Esc>``:set nopaste<CR>
map <leader>cp :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
map <leader>cP :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
map <leader>cl :PymodeLint<CR>
map <leader>cn vaC:NR<CR>:wincmd =<CR>
iabbrev pdb import ipdb; ipdb.set_trace()
iabbrev ppj import json; print json.dumps(, indent=4)

map <leader>/ <leader>c<space>
map <leader>a :Ag<space>
map <leader>b :CtrlPBuffer<CR>
map <leader>e :Tagbar<CR>

nnoremap <leader>fp 0f(a<CR><Esc>k0f(%i<CR><Esc>kV:s/, /,\r/g<CR>vib=k$%<<
map <leader>ft vab:s/[(,]/\0\r/g<CR>`[V`]=/)<CR>i<CR><ESC><<
vnoremap <leader>djt "vda{% trans "" %}<Esc>bb"vp

" git and diff stuff
map <leader>d2 :diffget //2 <bar> diffupdate<CR>
map <leader>d3 :diffget //3 <bar> diffupdate<CR>
map <leader>dg :diffget <bar> diffupdate<CR>
map <leader>do :diffoff<CR>
map <leader>dp :diffput <bar> diffupdate<CR>
map <leader>dt :diffthis<CR>
map <leader>du :diffupdate<CR>
map <leader>gb :Gblame -w<CR>
map <leader>gc :Gcommit<CR>
map <leader>ga :Gcommit --amend<CR>
map <leader>gh :GHComment<space>
map <leader>gg :Gist -b<space>
map <leader>gd :Gvdiff<space>
map <leader>gs :Gstatus<CR>
map <leader>gw :Gwrite<CR>

map <leader>y "vy
map <leader>p "vp
map <leader>P "vP

" File searching
map <leader>o :CtrlP<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })
nnoremap <leader>p :<C-u>Unite -start-insert file_rec/async:!<CR>
" consider moving split and vsplit to <leader>ws (and wv)

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-f --nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <Leader>s :Unite -no-quit -keep-focus grep:.<cr>
nnoremap <Leader>f :Unite -no-quit -keep-focus grep:

map <leader>s :w<CR>
map <leader>rt :r!./manage.py test 
map <leader>ta :CtrlPTag<CR>
map <leader>tt :tag<CR>
map <leader>tl :tselect<CR>
map <leader>tp :pop<CR>
map <leader>tj :tnext<CR>
map <leader>tk :tprevious<CR>
map <leader>u :GundoToggle<CR>
map <leader>v :vsplit<CR>
map <leader>w <C-w>
map <leader>W :%s/\s\+$//
map <leader>x :syntax on<CR>:source ~/.vimrc<CR>
" nnoremap <silent> <Esc> :noh<CR><Esc><Esc>

" remove annoying commands
nnoremap q: <Nop>
nnoremap Q <Nop>

vnoremap <silent> <Leader>0 :!python<cr>


" Syntax
" ======
" autocmd BufReadPost SCons* set syntax=python
" autocmd BufReadPost Cons* set syntax=perl
" autocmd BufReadPost *.mke set syntax=make
" autocmd BufReadPost make*.inc set syntax=make
" autocmd BufReadPost *.fcc set syntax=cpp
" autocmd BufReadPost *.fhh set syntax=cpp


" Settings
" ========

" the 'm' option enables the menu (:set go+=m)
set guioptions=acgt

" Show trailing whitespace
set list listchars=tab:»·,trail:·
" Hide them with leader s
" nmap <silent> <leader>s :set nolist!<CR>
" set nolist

if has('mouse')
    set mouse=a
endif

set cursorline
set cursorcolumn

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
set autoread               " Read any changes on disk if not altered in vim

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set whichwrap+=<,>,h,l,[,]

set hlsearch
nnoremap <silent> \ :noh<CR>
set incsearch              " start looking for search matches while typing
set showcmd
set wrapscan               " wrap search at the end of the document

" set relativenumber

" Indent well
set backspace=indent,eol,start

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

set nomodeline                  " Don't try to interpret modelines

" here's how you auto-wrap text:
" :setlocal textwidth=60
" " or with abbreviations:
" :setl tw=60
" reflow thusly:
" gqip
"
" See also :help auto-format
" :setl fo=acq
" :setlocal formatoptions=...

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
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" XForm validator:
map <leader>cx :!~/Dimagi/form_translate.jar validate "%"<CR>

" save view on files - folding, etc..
" autocmd BufWrite * mkview
" autocmd BufRead * silent loadview

noh

" ==============
" Custom Scripts
" ==============
function! Ctags()
    !ctags -R --tag-relative=yes --exclude=.git --exclude=node_modules --exclude=*.min.js
    !ctags -R --python-kinds=-i -a $VIRTUAL_ENV/lib/python2.7/site-packages/* --exclude=.git --exclude=node_modules --exclude=*.min.js
endfunction
nnoremap <leader>ct :call Ctags()<CR>

" function! Browse
" endfunction
command! -bar -nargs=1 Browse silent! exe '!firefox' shellescape(<q-args>, 1)

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

" nmap <leader>rr :call Ranger()<CR>


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
input_str = ''
for i, line in enumerate(lines):
    start = col1 if i == 0 else 0
    end = col2 if i == len(lines)-1 else 1000
    input_str += line[start:end]
char_sets = [string.lowercase, string.uppercase, string.digits, string.digits]
char_pool = ''
for char_set in char_sets:
    for char in input_str:
        if char in char_set:
            char_pool += char_set
            break
# char_pool = string.uppercase + string.digits*2
getrand = lambda: random.choice(char_pool)
def process_line(line, num):
    start = col1 if num == 0 else 0
    end = col2 if num == (line2-line1) else 1000
    return ''.join([
        getrand() if (
            start <= i <= end
            and char in char_pool
        ) else char
        for i, char in enumerate(line)
    ])
for i, line in enumerate(lines):
    buf[line1+i-1] = process_line(line, i)
EOF
endfunction
vnoremap <Leader>rr :call RandReplace()<cr>

function! SearchForString()
    :let [line1, col1] = searchpos("\\<", "bcn")
    :let [line2, col2] = searchpos("\\>", "cn")
    :let word = strpart(getline("."), col1-1, col2-col1)
    :call ag#Ag('grep', word)
endfunction
map <C-\> :call SearchForString()<CR>
nmap g* :Ag -w <C-R><C-W><space>


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

" esoergel's .vimrc

set nocompatible

" http://www.reddit.com/r/vim/comments/1424b3/what_do_you_need_mostfirst_when_starting_in_a_new/

" PLUGINS
" =======
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" To check out:
Plug 'tpope/vim-unimpaired'
" Plug 'vim-fuzzyfinder'
" command T

Plug 'gmarik/vundle'
Plug 'tpope/vim-sensible'


" EDITING
Plug 'tpope/vim-surround'
    let b:surround_{char2nr("{")} = "{{ \r }}"
    let b:surround_{char2nr("%")} = "{% \r %}"
    let b:surround_{char2nr("x")} = "{% trans \"\r\" %}"
Plug 'tpope/vim-repeat'
Plug 'Gundo'
    let g:gundo_width = 40
    let g:gundo_preview_height = 40
    let g:gundo_right = 0
" tab completion
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
" Plug 'Shougo/neocomplete.vim'
" Plug 'Valloric/YouCompleteMe'

" Plug 'Raimondi/delimitMate'
" Plug 'vim-scripts/paredit.vim'
Plug 'haya14busa/incsearch.vim'
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
Plug 'terryma/vim-expand-region'
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)
" Auto-detect indentation
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
    let NERDCommentWholeLinesInVMode=1
    let NERDSpaceDelims=1
    let NERDRemoveExtraSpaces=1
    let g:NERDCustomDelimiters = {
        \ 'html': {
          \ 'leftAlt': '{# ', 'rightAlt': ' #}',
          \ },
        \ 'lisp': { 'left': ';;'},
        \ 'python': { 'left': '#'},
      \ }
Plug 'karlbright/qfdo.vim'


" CODE
Plug 'othree/html5.vim'
Plug 'othree/xml.vim'
Plug 'groenewege/vim-less'
Plug 'fs111/pydoc.vim'
" Plug 'davidhalter/jedi-vim'
" Don't popup docstring window
autocmd FileType python setlocal completeopt-=preview
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
    " let g:pandoc#modules#disabled = ["folding"]
    " let g:pandoc#syntax#conceal#use = 0
Plug 'benekastah/neomake'
    autocmd! BufWritePost,BufReadPost * Neomake
    " ['python', 'frosted', 'pylama', 'flake8', 'pyflakes', 'pep8']
    " flake8 = pyflakes + pep8 + more
    let g:neomake_python_enabled_makers = ['python', 'pylama', 'pylint']
    " let g:neomake_javascript_enabled_makers = ['javascript']
    let g:neomake_javascript_enabled_makers = ['eslint']
    " let g:neomake_python_pylint_exe = '/home/ethan/virtualenvs/hq3/bin/pylint'
    let g:neomake_error_sign={
        \ 'text': '>>',
        \ 'texthl': 'WarningMsg',
        \ }
    let g:neomake_warning_sign={
        \ 'text': '->',
        \ 'texthl': 'MoreMsg',
        \ }
    let g:neomake_python_pylama_maker={
        \ 'exe': 'pylama',
        \ 'args': ['--ignore', 'E501,W503'],
        \ }
    let g:neomake_python_mccabe_maker={
        \ 'exe': 'pylama',
        \ 'args': ['--linters', 'mccabe'],
        \ }

" Plug 'klen/python-mode'
    " let g:pymode_lint = 0
    " " let g:pymode_lint_on_write = 0
    " " let g:pymode_lint_ignore = ""
    " let g:pymode_lint_message = 1
    " let g:pymode_lint_cwindow = 0
    " " https://github.com/python-rope/rope/blob/master/docs/overview.rst
    " let g:pymode_rope = 1
    " let g:pymode_rope_rename_bind = "<leader>rr"
    " let g:pymode_rope_autoimport_bind = "<leader>ri"
    " let g:pymode_rope_organize_imports_bind = '<leader>roi'
    " let g:pymode_rope_extract_method_bind = '<leader>rm'
    " let g:pymode_rope_extract_variable_bind = '<leader>rv'
    " let g:pymode_options_max_line_length = 80
    " let g:pymode_folding = 0
    " let g:pymode_doc = 0
    " let g:pymode_doc_bind = 'K'
    " let g:pymode_trim_whitespaces = 0
    " let g:pymode_breakpoint = 0
    " let g:pymode_breakpoint_bind = '<leader>dldb'


" NAVIGATION
" Plug 'Numkil/ag.nvim'
Plug 'rking/ag.vim'
  let g:ag_prg="ag --column --smart-case"
  let g:ag_highlight=1
" Sublime Text style multiple selection
Plug 'terryma/vim-multiple-cursors'
  let g:multi_cursor_exit_from_insert_mode=0
  let g:multi_cursor_exit_from_visual_mode=0
Plug 'majutsushi/tagbar'
    let g:tagbar_sort = 0
Plug 'tagexplorer.vim'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
    " Auto close NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    let NERDTreeIgnore=[
        \ '\~$',
        \ '\.pyc$',
        \ ]
    let g:NERDTreeMapUpdirKeepOpen = "-"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
Plug 'Lokaltog/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
    let g:nrrw_rgn_vert = 1
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'h1mesuke/unite-outline'
    let g:unite_winheight=12
Plug 'ludovicchabant/vim-gutentags'


" UI
Plug 'CSApprox'
" Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
    let g:solarized_termcolors=256
Plug 'junegunn/seoul256.vim'
    let g:seoul256_background = 203
Plug 'morhetz/gruvbox'
    if !has("gui_running")
        let g:gruvbox_italic=0
    endif
Plug 'chriskempson/base16-vim'
    let base16colorspace=256
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'osyo-manga/vim-brightest'
Plug 'kien/rainbow_parentheses.vim'
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
    au Syntax * RainbowParenthesesLoadChevrons

" GIT
let g:github_user = 'esoergel'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim' | Plug 'mmozuras/vim-github-comment'

call plug#end()

" Eigengrau is #16161D, (22, 22, 29)
" (http://en.wikipedia.org/w/index.php?title=Eigengrau&oldid=561213458)
" set background=light
set background=dark
" colorscheme solarized
" colorscheme desert
colorscheme gruvbox
" colorscheme seoul256
" if has("gui_running")
" colorscheme Tomorrow-Night-Eighties
" endif
" colorscheme seoul256-light
" colorscheme elflord


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

map <leader>y "+y
map <leader>p "+p
map <leader>P "+P

" File searching and FZF stuff
nnoremap <leader>o :FZF<CR>
nnoremap <silent> <leader>b :FzfHistory<CR>
nnoremap <silent> <leader>B :FzfBuffers<CR>
nnoremap <silent> <leader>: :FzfCommands<CR>

" Ctags searching
nnoremap <leader>ta :FzfTags<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })
" nnoremap <leader>p :<C-u>Unite -start-insert file_rec/async:!<CR>
" consider moving split and vsplit to <leader>ws (and wv)

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-f --nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>s :Unite -no-quit -keep-focus grep:.<cr>
nnoremap <leader>f :Unite -no-quit -keep-focus grep:

map <leader>s :w<CR>
map <leader>rt :r!./manage.py test 
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

" Terminal Mode Bindings
" ======================
:tnoremap <Esc> <C-\><C-n>
" Move between windows with alt+hjkl
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

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
set colorcolumn=80

set number                 " show line numbers
set ignorecase
set smartcase              " Make searches case-sensitive iff search is mixed case
set autoread               " Read any changes on disk if not altered in vim

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set whichwrap+=<,>,h,l,[,]

set hlsearch
nnoremap <silent> \ :noh<CR>
nnoremap <silent> <leader>sc :noh<CR>
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

" set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set nobackup
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
    " !ctags -R --tag-relative=yes --exclude=.git --exclude=node_modules --exclude=*.min.js
    !ctags -f $VIRTUAL_ENV/lib/python2.7/site-packages/tags $VIRTUAL_ENV/lib/python2.7/site-packages/*
endfunction
set tags=tags,$VIRTUAL_ENV/lib/python2.7/site-packages/tags
nnoremap <leader>ct :call Ctags()<CR>

" function! Browse
" endfunction
command! -bar -nargs=1 Browse silent! exe '!firefox' shellescape(<q-args>, 1)

" Use ranger as vim file manager
" ==============================
function! Ranger()
    let temp = tempname()
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction

" function! Ranger()
    " " Get a temp file name without creating it
    " let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " " Launch ranger, passing it the temp file name
    " silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " " If the temp file has been written by ranger
    " if filereadable(tmpfile)
        " " Get the selected file name from the temp file
        " let filetoedit = system('cat '.tmpfile)
        " exec 'edit '.filetoedit
        " call delete(tmpfile)
    " endif
    " redraw!
" endfunction

" nmap <leader>ra :call Ranger()<CR>
nnoremap <leader>ra :call Ranger()<CR>


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
vnoremap <Leader>Rr :call RandReplace()<cr>

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

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
export TERM=screen-256color

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# SETTING COLORS IN THE PROMPT
# \[\]
# $(tput rev) invert colors
# $(tput bold) make bold
# $(tput setaf 1) set foreground
# $(tput setab 1) set background
# 0   Black
# 1   Red
# 2   Green
# 3   Yellow
# 4   Blue
# 5   Magenta
# 6   Cyan
# 7   White

# reset everything
# \[$(tput sgr0)\]

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[$(tput rev)\]\u@\h:\[$(tput sgr0)\] \w\n\[$(tput setaf 2)\]\$\[$(tput sgr0)\] '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# virtualenvwrapper stuff
# export WORKON_HOME=~/virtualenvs
# export PROJECT_HOME=$HOME/web_dev
# alias setvenv='source $WORKON_HOME/setvenv'
# source /usr/local/bin/virtualenvwrapper.sh


# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Load pyenv-virtualenv automatically by adding
# eval "$(pyenv virtualenv-init -)"



# Mechanical Turk
export MTURK_CMD_HOME=/home/ethan/libs/aws-mturk-clt-1.3.1
export JAVA_HOME=/usr/


for SCRIPT in \
      ~/.tmuxinator/tmuxinator.bash \
      ~/libs/django_bash_completion.sh \
      ~/.fzf.bash \
      ~/.bashmarks.sh \
      ~/.bash_aliases.sh \
      ~/git_scripts.sh \
      ~/shell_scripts.sh \

  do
    if [ -f $SCRIPT ]; then
        source $SCRIPT
    fi
  done

alias brew=~/.linuxbrew/bin/brew
# export PATH='/home/ethan/.linuxbrew/bin:$PATH'

# from http://mrgris.com/blog/2013-06-16-command-line-history-done-right/
export PROMPT_COMMAND="history -a"
alias refresh='history -c; history -r'
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=1000000

# http://www.catonmat.net/download/bash-vi-editing-mode-cheat-sheet.pdf
# http://vim.wikia.com/wiki/Use_vi_shortcuts_in_terminal
set editing-mode vi
set keymap vi-command
bind -m vi-insert "\C-l":clear-screen

export PATH="$PATH:~/bin:~/.cabal/bin:"
# "/home/ethan/anaconda/bin"  # anacondas is naughty with my namespace

export XDG_CONFIG_HOME=$HOME/.config

export EDITOR='vi'
# alias vim=nvim

alias lessc=/usr/lib/node_modules/less/bin/lessc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# commcare-cloud stuff
export PATH=$PATH:~/.commcare-cloud/bin:~/virtualenvs/ansible/bin/
source ~/commcare-cloud/src/commcare_cloud/.bash_completion

# synclient TapButton1=1 TapButton2=3 TapButton3=2

# Ruby Gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

alias cl="clear && ls"
alias u="cd ../"

# alias tags="ctags -R -f ./.git/tags ."

# Django stuff
alias dj="python manage.py"
alias djrun="python manage.py runserver"

# Programs
# alias sublime="~/Sublime\ Text\ 2/sublime_text"
# alias hub=~/libs/hub
alias lessc='nodejs /opt/lessc/bin/lessc'
alias xcape=~/libs/xcape/xcape 
alias xinit=~/.xinitrc
alias we='workon hq37 && source venv'
alias de='deactivate && cd ~'
alias node='nodejs'

alias we='cd ~/commcare-hq && pyenv activate hq && source venv'
alias de='pyenv deactivate && cd ~'

alias dimagi-gpg="gpg --keyring dimagi.gpg --no-default-keyring"

function hqstart() {
    we &&
    ./scripts/docker start couch elasticsearch5 kafka postgres redis
    # formplayer riakcs
}
function hqstop() {
    we &&
    ./scripts/docker stop
}

function mouse() {
    echo "sudo vi /etc/udev/rules.d/10-trackpoint.rules"
    echo "sudo vi /etc/conf.d/trackpoint"
    echo "sudo /etc/conf.d/trackpoint"
}

alias less="less -r"

# export PATH=$PATH:~/.commcare-cloud/bin
source ~/commcare-cloud/src/commcare_cloud/.bash_completion
function cchq-update() {
    cd ~/commcare-cloud &&
    pyenv activate cchq &&
    update-code &&
    pip install --upgrade pip &&
    pip install -e . &&
    source ~/commcare-cloud/src/commcare_cloud/.bash_completion

    # workon ansible &&
    # update-code &&
    # pip install -e . &&
    # source ~/.commcare-cloud/repo/src/commcare_cloud/.bash_completion
    # [ -t 1 ] && source ~/init-ansible
}

function check-steel() {
    python -c 'import requests
for thickness in [125, 15626]:
    for width in ["1-25", "1-5", "2", "2-5", "3", "4"]:
        res = requests.post(
            "http://newjerseysteelbaron.com/shop/1084hc/?wc-ajax=get_variation",
            data={"attribute_pa_thickness": thickness, "attribute_pa_width": width,
                "attribute_pa_length": 48, "product_id": 227,}
        )
        print thickness, width, "in stock?", res.json()["is_in_stock"]'
}

# virtualenvwrapper stuff
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=$HOME/web_dev
alias setvenv='source $WORKON_HOME/setvenv'
# source /usr/local/bin/virtualenvwrapper.sh

# git code updates
function pyc-purge() {
    find . -name '*.pyc' -delete
}
function pull-latest-master() {
    git checkout master; git pull origin master
    git submodule update --init
    git submodule foreach --recursive 'git checkout master; git pull origin master &'
    until [ -z "$(ps aux | grep '[g]it pull')" ]; do sleep 1; done
}
function update-code() {
    pull-latest-master
    git submodule update --recursive
    pyc-purge
}

# Mechanical Turk
export MTURK_CMD_HOME=/home/ethan/libs/aws-mturk-clt-1.3.1
export JAVA_HOME=/usr/

source ~/.tmuxinator/tmuxinator.bash
source ~/libs/django_bash_completion.sh

alias brew=~/.linuxbrew/bin/brew
# export PATH='/home/ethan/.linuxbrew/bin:$PATH'

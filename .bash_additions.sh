# virtualenvwrapper stuff
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=$HOME/web_dev
alias setvenv='source $WORKON_HOME/setvenv'
# source /usr/local/bin/virtualenvwrapper.sh

function apt-update() {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
}
function show-branches-long() {
    for BRANCH in `git br | grep -v '\\*'`
    do
        echo "$(tput rev)$BRANCH$(tput sgr0)"\
        $(git log $BRANCH -1\
        --pretty="
            %C(yellow)%s
            <break>
            %C(magenta)%ad
            %C(blue) [%cn]
            %C(green)%h
            %C(red)%d
            %C(reset)
            <break>
        " --source\
        ) | sed 's/<break>/\n/g'
    done
}
function show-branches() {
    for BRANCH in `git br | grep -v '\\*'`
    do
        echo $(git log $BRANCH -1\
        --pretty="
            %C(magenta)%ad
            %C(reset)<name>
            %C(yellow)%s
            %C(reset)
        ") | sed "s/<name>/$BRANCH -/g"
    done
}

# git code updates
function pyc-purge() {
    find . -name '*.pyc' -delete
}
function pull-latest-masters() {
    git checkout master
    git pull origin master
    git submodule update --init
    git submodule foreach --recursive 'git checkout master; git pull origin master &'
    until [ -z "$(ps aux | grep '[g]it pull')" ]; do sleep 1; done
    pyc-purge
}
function update-code() {
    git checkout master
    git pull origin master
    git submodule update --init --recursive
    pyc-purge
}

# Mechanical Turk
export MTURK_CMD_HOME=/home/ethan/libs/aws-mturk-clt-1.3.1
export JAVA_HOME=/usr/

source ~/.tmuxinator/tmuxinator.bash
source ~/libs/django_bash_completion.sh

alias brew=~/.linuxbrew/bin/brew
# export PATH='/home/ethan/.linuxbrew/bin:$PATH'

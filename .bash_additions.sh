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

function show-branches() {
    for BRANCH in `git branch | grep -v '\\*'`
    do
        echo $(git show --no-patch $BRANCH\
        --pretty="
            %C(magenta)%ad
            %C(reset)<name>
            %C(yellow)%s
            %C(red)%d
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
    git fetch origin
    git merge origin/master
    git submodule update --init --recursive
    pyc-purge
}

function current-branch() {
    git rev-parse --abbrev-ref HEAD
}

function files-changed() {
    branch=$(current-branch) 
    last_commit=$(git merge-base $branch origin/master)
    git diff --stat $branch $last_commit
}

# PR current branch
function PR() {
    branch=$(current-branch) 
    origin_url=$(git config --get remote.origin.url)
    origin=$(python -c "import re; print re.split('[:/]', '$origin_url')[-2]")
    if [ $branch == "master" ]
    then 
        echo "You're on master, you big dummy!"
    else
        echo "PRing $branch to $origin_url"
        git push origin $branch
        hub pull-request -b $origin:master -h $origin:$branch
    fi
}

# Mechanical Turk
export MTURK_CMD_HOME=/home/ethan/libs/aws-mturk-clt-1.3.1
export JAVA_HOME=/usr/

source ~/.tmuxinator/tmuxinator.bash
source ~/libs/django_bash_completion.sh

alias brew=~/.linuxbrew/bin/brew
# export PATH='/home/ethan/.linuxbrew/bin:$PATH'

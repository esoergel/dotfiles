# virtualenvwrapper stuff
export WORKON_HOME=~/virtualenvs
export PROJECT_HOME=$HOME/web_dev
alias setvenv='source $WORKON_HOME/setvenv'
# source /usr/local/bin/virtualenvwrapper.sh

## git alias maker
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    #. /etc/bash_completion                                                                                                                                                                
#fi

#function_exists() {
    #declare -f -F $1 > /dev/null
    #return $?
#}

#for al in `__git_aliases`; do
    #alias g$al="git $al"

    #complete_func=_git_$(__git_aliased_command $al)
    #function_exists $complete_fnc && __git_complete g$al $complete_func
#done

# git code updates
function delete-pyc() {
    find . -name '*.pyc' -delete
}
function pull-latest-master() {
    git checkout master; git pull origin master
    git submodule update --init
    git submodule foreach --recursive 'git checkout master; git pull origin master &'
    until [ -z "$(ps aux | grep '[g]it pull')" ]; do sleep 1; done
}
function pull-code() {
    pull-latest-master
    delete-pyc
}

# Mechanical Turk
export MTURK_CMD_HOME=/home/ethan/libs/aws-mturk-clt-1.3.1
export JAVA_HOME=/usr/

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

# PR current branch
# Uses https://hub.github.com/
function PR() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    origin_url=$(git config --get remote.origin.url)
    origin=$(python -c "import re; print re.split('[:/]', '$origin_url')[-2]")

    if [[ $branch == "master" ]]
    then
        echo "You're on master, you big dummy!"
        return 1
    fi

    echo "PRing $branch to $origin_url"
    git push origin $branch
    if [[ $? != 0 ]]
    then
        echo "Failure while pushing to origin.  You might need to 'push -f'."
        return 1
    fi

    hub pull-request -b $origin:master -h $origin:$branch
}


function git-discard-changes() {
    for submodule in $(git submodule | sed 's/^+/ /' | cut -f3 -d' ')
    do
        cd $submodule
        git checkout -- .
        cd -
    done
}

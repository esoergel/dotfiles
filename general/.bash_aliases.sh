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
    ./scripts/docker start couch elasticsearch2 kafka postgres redis
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

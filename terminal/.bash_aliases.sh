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
alias we='workon hq && source venv'
alias de='deactivate && cd ~'
alias hqstart='we && sudo ./scripts/docker start && sleep 2 && sudo ./scripts/docker restart kafka'
alias hqstop='we && sudo ./scripts/docker stop'
alias node='nodejs'

alias dimagi-gpg="gpg --keyring dimagi.gpg --no-default-keyring"

function mouse() {
    echo "sudo vi /etc/udev/rules.d/10-trackpoint.rules"
    echo "sudo vi /etc/conf.d/trackpoint"
    echo "sudo /etc/conf.d/trackpoint"
}

alias less="less -r"
alias fab='fab -f ~/.commcare-cloud/repo/fab/fabfile.py'

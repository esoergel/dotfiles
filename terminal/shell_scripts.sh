function apt-update() {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
}

function slack-slay() {
    ps aux | grep slac[k] | awk '{print $2}' | xargs kill -9
}

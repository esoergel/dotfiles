#!/bin/bash

sudo apt-get install stow
# stow vi
stow general
# stow emacs

if [ true = false ]; then

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update

# install vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# use neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

fi

sudo apt-get install -y \
    git \
    neovim \
    npm \
    curl \
    python \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    ranger \
    ctags \
    tmux \
    ruby \
    tilda \
    vlc \
    xsel \
    silversearcher-ag \
    emacs \
    pass \
    calibre \


sudo gem install tmuxinator

sudo npm install -g eslint

# sudo pip install neovim
sudo pip install virtualenv virtualenvwrapper

# install xcape
mkdir -p ~/libs/xcape
sudo apt-get install -y gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git ~/libs/xcape
cd ~/libs/xcape
make
sudo make install
cd -

# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

snap install spotify


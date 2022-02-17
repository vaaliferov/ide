#!/usr/bin/env bash

sudo apt install -y wget curl aria2 tmux vim xclip htop kitty pandoc

VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs $VIM_PLUG_URL
cp configs/vim/vimrc ~/.vimrc && vim +PlugInstall +qall # vim -> :PlugInstall
cp configs/tmux/tmux.conf ~/.tmux.conf

BTOP_URL="https://github.com/aristocratos/btop/releases/download/v1.1.1/btop-1.1.1-x86_64-linux-musl.tbz"
mkdir -p btop && cd btop && wget $BTOP_URL -O btop.tbz && tar -xjf btop.tbz
sudo make install && cd .. && rm -rf btop

mkdir -p ~/.config/kitty/colors
cp configs/kitty/colors/*  ~/.config/kitty/colors
cat configs/kitty/kitty.conf > ~/.config/kitty/kitty.conf
mkdir -p /usr/share/fonts/kitty
cp fonts/* /usr/share/fonts/kitty/
fc-cache
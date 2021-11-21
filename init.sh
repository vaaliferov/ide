#!/usr/bin/env bash

sudo apt install -y wget curl aria2 tmux vim xclip htop kitty
sudo apt install -y python3-pip python3-venv python3-sklearn pandoc

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
sudo mkdir -p /usr/share/fonts/kitty
sudo cp fonts/* /usr/share/fonts/kitty/
sudo fc-cache

python3 -m pip install virtualenv
mkdir -p dev && python3 -m venv dev

source dev/bin/activate
python3 -m pip install wheel cython
python3 -m pip install tqdm gdown joblib
python3 -m pip install ipykernel ipython jupyterlab nbconvert
python3 -m pip install numpy pandas scipy scikit-learn matplotlib
python3 -m pip install nltk gensim sentencepiece youtokentome 
python3 -m pip install transformers datasets tokenizers
python3 -m pip install sparsesvd catboost lightgbm
python3 -m pip install https://download.pytorch.org/whl/cpu/torch-1.10.0%2Bcpu-cp39-cp39-linux_x86_64.whl
# python3 -m jupyter kernelspec list
# python3 -m jupyter kernelspec uninstall dev
python3 -m ipykernel install --user --name dev
deactivate

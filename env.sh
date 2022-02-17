#!/usr/bin/env bash

USER=vaaliferov
ENV_PATH=/home/$USER/dev

rm -rf $ENV_PATH
rm -rf ~/.cache/pip
# pip3 freeze > /tmp/packages.txt
# pip3 uninstall -y -r /tmp/packages.txt

apt update
apt autoclean -y
apt autoremove -y
apt install -y python3-pip
apt install -y python3-venv
apt install -y python3-sklearn
apt install -y libopencv-dev
apt install -y python3-opencv
pip3 install virtualenv gdown

python3 -m venv $ENV_PATH
source $ENV_PATH/bin/activate
pip3 install --no-cache-dir wheel cython
pip3 install --no-cache-dir -r req_dev.txt
pip3 install --no-cache-dir -r req_cpu.txt
ipykernel install --user --name $ENV_PATH
deactivate

chmod 755 $ENV_PATH
chown -R $USER:$USER $ENV_PATH

# pip3 list --outdated
# python3 -m jupyter kernelspec list
# python3 -m jupyter kernelspec uninstall $ENV_PATH
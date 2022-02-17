#!/usr/bin/env bash

USER=vaaliferov
ENV_PATH=/home/$USER/dev
WORK_DIR=/home/$USER/github

source $ENV_PATH/bin/activate
python3 -m jupyter notebook --notebook-dir=$WORK_DIR
deactivate
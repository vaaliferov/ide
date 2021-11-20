#!/usr/bin/env bash
tmux new-session -d -s mysession
tmux split-window -h
tmux select-pane -t 1
tmux send './dev/bin/ipython3 --matplotlib' ENTER
tmux split-window -v
tmux select-pane -t 3
tmux send 'export TERM=xterm-256color; btop' ENTER
tmux select-pane -t 0
tmux send 'export TERM=xterm-256color; vim' ENTER
tmux a # open (attach) tmux session

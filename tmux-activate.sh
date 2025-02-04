#!/bin/bash

git config advice.addIgnoredFile false
git config --global user.email "novatrace@yandex.ru"
git config --global user.name "novka-serv"

session="minecraft"

if tmux has-session -t "$session" 2>/dev/null; then
    echo "session $session already exists"
    return 0
fi

tmux new-session -d -s $session
tmux split-window -h
tmux send-keys -t $session:0.1 "btop" C-m
tmux select-pane -t $session:0.0
tmux send-keys -t $session:0.0 "git diff --name-only" C-m


tmux attach -t $session

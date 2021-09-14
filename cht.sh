#!/usr/bin/env bash

selected=`cat ~/.config/dotfiles/.tmux-cht-languages ~/.config/dotfiles/.tmux-cht-command | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/dotfiles/.tmux-cht-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
bind-key -r i run-shell "tmux neww tmux-cht.sh"

#!/usr/bin/env bash
# extracted from ThePremeagen dotfiles
selected=`cat ~/.config/dotfiles/.tmux-cht-languages ~/.config/dotfiles/.tmux-cht-command | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/dotfiles/.tmux-cht-languages; then
  query=`echo $query | tr ' ' '+'`
  tmux neww zsh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
  query=`echo $query | tr ' ' '+'`
  tmux neww zsh -c "echo \"curl cht.sh/$selected~$query/\" & curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
  #tmux neww bash -c "curl -s cht.sh/$selected~$query"
fi
bind-key -r i run-shell "tmux neww tmux-cht.sh"

#!/usr/bin/env bash

# tmux integration
if [[ $TMUX_PANE ]]; then {
  tmux set -p @context $(basename $CONTEXT_PATH)
  tmux rename-window '#{@context}'
  tmux set-hook -g pane-focus-in 'rename-window "#{@context}"'
} fi


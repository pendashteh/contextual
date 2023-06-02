#!/usr/bin/env bash

# tmux integration
if [[ $TMUX_PANE ]]; then {
  tmux set -p @context $CONTEXT
  tmux rename-window '#{@context}'
  tmux set-hook -g pane-focus-in 'rename-window "#{@context}"'
} fi


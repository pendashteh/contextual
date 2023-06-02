#!/usr/bin/env bash

# tmux integration
if [[ $TMUX_PANE ]]; then {
  # sets the default context
  __context=$(tmux display-message -p '#W')
} fi

alias ::='source contextual'

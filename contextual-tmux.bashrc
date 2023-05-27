#!/usr/bin/env bash

# tmux integration
if [[ $TMUX_PANE ]]; then {
  __context=$(tmux display-message -p '#W')
} fi


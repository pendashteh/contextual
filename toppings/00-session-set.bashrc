#!/usr/bin/env bash


__context=${__context:-'main'}

# tmux integration
if [[ $TMUX_PANE ]]; then {
  # sets the default context
  __context=$(tmux display-message -p '#W')
} fi

read -p 'context name? [default: '$__context'] ' context

__context=${context:-$__context}

# Set environmental variables for current context
export CONTEXT=$__context

#! /usr/bin/env bash

_contextual_tmux_update() {
  : 'https://stackoverflow.com/a/9757133/257479'
  printf '\033]2;%s\033\\' "context: $CONTEXT"
}

context__default='main'
if [[ $TMUX_PANE ]]; then {
  local context__default=$(tmux display-message -p '#{pane_id}')
  local context_domain=$(basename $(tmux display-message -p "#{socket_path}"))
} fi
read -p "context name? [default: ${context__default}] " context
source contextual --domain $context_domain set ${context:-$context__default}

alias ::='source contextual'

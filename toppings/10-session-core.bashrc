#!/usr/bin/env bash

test -z $CONTEXT && return

export CONTEXT_DATADIR=${CONTEXT_DATADIR:-$HOME/.contextual}

# Set environmental variables for current context
export CONTEXT_PATH=$CONTEXT_DATADIR/contexts/$CONTEXT
mkdir -p $CONTEXT_PATH

# Create notes
touch $CONTEXT_PATH/notes

# add to timeline
printf '%s\t%s\n' "$(date)" $CONTEXT_PATH >> $CONTEXT_DATADIR/timeline

# PATHS

# Caoture working directories
touch $CONTEXT_PATH/pwd

test -s $CONTEXT_PATH/pwd && {
  cd $(tail -n1 $CONTEXT_PATH/pwd)
}

# HISTORY

# Set history
shopt -s histappend
export HISTFILE=$CONTEXT_PATH/bash_history

# COMMAND

# Create command
touch $CONTEXT_PATH/command
command=$(cat $CONTEXT_PATH/command)
if [[ -n $command ]]; then
  __exec $command
fi

# DISPLAY

# sets the title for terminal window
: 'https://stackoverflow.com/a/9757133/257479'
printf '\033]2;%s\033\\' "context: $CONTEXT"

export _ps1_pre_context=${_ps1_pre_context:-$PS1}
export PS1="[$CONTEXT] $PS1"

# tmux integration
if [[ $TMUX_PANE ]]; then {
  tmux set -p @context $CONTEXT
  tmux rename-window '#{@context}'
  tmux set-hook -g pane-focus-in 'rename-window "#{@context}"'
} fi

#!/usr/bin/env bash

# sets the title for terminal window
: 'https://stackoverflow.com/a/9757133/257479'
printf '\033]2;%s\033\\' "context: $CONTEXT"

export _ps1_pre_context=${_ps1_pre_context:-$PS1}
export PS1="[$CONTEXT] $_ps1_pre_context"


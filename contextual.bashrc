#! /usr/bin/env bash

read -e -p "context name? " context
test -z $context || {
  source contextual set ${context}
}


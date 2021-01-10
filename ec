#!/bin/bash

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  emacs -nw "$@"
else
  emacsclient -a "" -c "$@"
fi

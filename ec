#!/bin/bash

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  emacsclient -a "" -t "$@"
else
  emacsclient -a "" -c "$@"
fi

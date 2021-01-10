#!/bin/bash

if [ -n "$SUDO_COMMAND" ]; then
  vim "$@"
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  emacsclient -a "" -t "$@"
else
  emacsclient -a "" -c "$@"
fi

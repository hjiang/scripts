#!/usr/bin/env bash
set -euo pipefail

PATH=/opt/homebrew/bin:$PATH

source $HOME/.config/restic/env.sh

FILE_LIST=$HOME/.config/restic/files.txt

if [[ -f $FILE_LIST ]]; then
    restic backup --quiet --cleanup-cache \
        --exclude-file=$HOME/.config/restic/exclude.txt \
        --files-from=$FILE_LIST > /dev/null
else
    restic backup --quiet --cleanup-cache \
        --exclude-file=$HOME/.config/restic/exclude.txt $HOME > /dev/null
fi
restic forget --quiet --keep-last 3 --keep-hourly 72 --keep-daily 30 \
    --keep-weekly 25 --keep-monthly 36 --keep-yearly 20 --host "$(hostname)" \
    --cleanup-cache --prune > /dev/null

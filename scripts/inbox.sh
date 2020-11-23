#!/bin/bash

INBOX_PATH=$HOME/var/INBOX
CONFIG_PATH=$HOME/.inbox.yml
TERMINAL=alacritty
TERMINALOPTS="--config-file $CONFIG_PATH --command"

function commit {
    local mode=$1
    local file=$2

    cd $INBOX_PATH

    git pull
    git add $file
    git commit -m "$mode $file from $HOSTNAME" &>/dev/null
    git push

    cd - &>/dev/null
}

function run_editor {
    local tmpfile=$(mktemp --suffix=".md")
    local timestamp=$(date +%d%m%YH%H%M%S)
    local filename="$timestamp.md"

    $EDITOR $tmpfile

    if [ $? != 0 ]; then
        echo "Discarding..."
        exit 1
    fi

    cp $tmpfile "$INBOX_PATH/$filename"
    commit "add" "$filename" &> /dev/null &
}

function open_terminal {
    $TERMINAL $TERMINALOPTS bash -c '$HOME/bin/inbox.sh editor'
}

function main {
    if [[ $1 == "terminal" ]]; then
        open_terminal
    elif [[ $1 == "editor" ]]; then
        run_editor
    else
        open_terminal
    fi
}

main $1

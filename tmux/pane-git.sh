#!/bin/bash

function branch {
    local path=$1

    local branch=$(git -C $path branch 2>/dev/null | grep -E "^\*" | sed 's/* //g')
    local status=$(git -C $path status -s | awk '{print $1}' | sort | uniq -c | sed 's/^ *//g' | paste -sd '|' - | sed 's/ //g')
    if [[ ! -z $status ]]; then
        status=" $status"
    fi

    if [[ ! -z $branch ]]; then
        echo "($branch$status)"
    else
        echo ""
    fi
}

echo "$1 $(branch $1)"

#!/bin/bash

function branch {
    local path=$1

    local branch=$(git -C $path branch 2>/dev/null)

    if [[ ! -z $branch ]]; then
        echo "($branch)"
    else
        echo ""
    fi
}

echo "$1 $(branch $1)"

#!/bin/bash

if [ -f ~/.cluster-override.txt ]; then
    cat ~/.cluster-override.txt
    exit 0
fi

cluster=$(kubectl config current-context | awk -F "_" {'print $4'})
namespace=$(kubectl config view --minify | grep -oP 'namespace: \K(.*)')

echo "$cluster/$namespace"

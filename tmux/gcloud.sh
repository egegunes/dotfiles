#!/bin/bash

if [ -f ~/.gcloud-override.txt ]; then
    cat ~/.gcloud-override.txt
    exit 0
fi

echo $(gcloud config get-value project 2>/dev/null)

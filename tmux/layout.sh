#!/bin/bash

if [[ $(xset -q|grep LED| awk '{ print $10 }') == "00000000" ]]; then
    echo "us";
else
    echo "tr";
fi

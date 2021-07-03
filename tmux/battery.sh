#!/bin/bash

pmset -g batt | tail -n 1 | awk '{print $3 FS $4 FS $5 FS $6}'

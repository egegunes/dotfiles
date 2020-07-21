#!/bin/bash

kubectl config current-context | awk -F "_" {'print $4'}

#!/bin/bash

echo $(gcloud config get-value project 2>/dev/null)

#!/usr/bin/env bash

source config.sh

for lang in ${LANGS[@]}; do
    echo "Cleaning up $lang..."
    cd $lang
    ./cleanup.sh
    cd ..
done

#!/usr/bin/env bash

source config.sh

for lang in ${LANGS[@]}; do
    echo "Setting up $lang..."
    cd $lang
    ./setup.sh
    cd ..
done

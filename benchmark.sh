#!/usr/bin/env bash

source config.sh

./setup_all.sh

LANGS_LEN=${#LANGS[@]}

for (( i=0; i<${LANGS_LEN}; i++ )); do
    LANGS[$i]="${LANGS[i]}/calculate $COUNT"
done

hyperfine --warmup 3 "${LANGS[@]}"

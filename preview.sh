#!/usr/bin/env bash

# if string is raw cat file named raw
if [[ $1 == "raw" ]]; then
  tail -n +1 -f raw
else
  # replace whitespace with dash
  filename=$(echo $1 | tr ' ' '-')
  aichat -m claude:claude-3-5-sonnet-20241022 -f raw $1 | tee -a $filename | bat -l markdown --style=plain --color=always
fi

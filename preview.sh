#!/usr/bin/env bash

model="openai:gpt-4o-mini"

# if $1 is an empty string or "original"
if [ -z "$1" ] || [ "$1" == "original" ]; then
  # cat the raw file
  tail -n +1 -f content/0
else
  # replace whitespace with dash
  # filename=$(echo $1 | tr ' ' '-')
  filename="$2"

  role_count=$(cat roles.txt | wc -l)
  # if filename is role_count then this is a custom prompt
  if [ $filename -eq $role_count ]; then
    aichat -m "$model" \
      --prompt 'You are a text editer. Based on the input text and instruction, produce output text. Do not output anything other than the output text.' \
      -f content/0 $1 |
      tee content/$filename |
      bat -l markdown --style=plain --color=always headers/evaluated /dev/stdin headers/original content/0
  else
    aichat -m "$model" -f content/0 -r $1 |
      tee content/$filename |
      bat -l markdown --style=plain --color=always headers/evaluated /dev/stdin headers/original content/0
  fi
fi

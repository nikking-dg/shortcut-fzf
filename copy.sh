#!/usr/bin/env bash
filename=$(echo "$1" | tr ' ' '-')
# test if file exists
if [ -f "content/$filename" ]; then
  cat "content/$filename" | gpaste-client add
fi

#!/usr/bin/env bash

rm raw
touch raw
# don't display stderr for now
websocat-deepgram >>raw 2>/dev/null &

cat roles.txt | fzf -e \
  --header 'ctrl+r: refresh, tab: use query as prompt' \
  --preview './preview.sh {}' \
  --bind "ctrl-r:refresh-preview" \
  --bind "tab:reload:cat roles.txt <(echo {q})" \
  --preview-window=wrap |
  tr ' ' '-' |
  xargs -I {} sh -c 'cat "{}"' |
  gpaste-client add

# cleanup
pkill websocat

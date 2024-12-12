#!/usr/bin/env bash

cd ~/repos/shortcut-fzf

source .envrc

rm content/*
touch content/0
# don't display stderr for now

cat roles.txt | fzf -e \
  --header 'ctrl+d: toggle dictation, ctrl+f: diff, ctrl+v: paste, ctrl+e: edit, ctrl+r: reevaluate, tab: evaluate custom prompt' --header-first \
  --preview "./preview.sh {} {n}" \
  --bind "ctrl-v:execute-silent(./paste.sh)" \
  --bind "ctrl-d:transform-prompt(./toggle-dictation.sh)" \
  --bind "ctrl-f:execute(delta --paging always -s content/0 content/{n})" \
  --bind "ctrl-e:execute(./edit.sh)+refresh-preview" \
  --bind "ctrl-r:refresh-preview" \
  --bind "tab:reload-sync(cat roles.txt <(echo {q}))" \
  --bind "enter:execute-silent(./copy.sh {n})+abort" \
  --preview-window=wrap,down

pkill websocat

exit 0

#!/usr/bin/env bash

# $TERMINAL is also used by launcher-fzf
export TERMINAL="$HOME/.nix-profile/bin/alacritty"

WINDOW_TOGGLE_SEARCH="alacritty-launcher-config.toml"

if pgrep -f $WINDOW_TOGGLE_SEARCH; then
  pkill --full "alacritty-launcher-config.toml"
else
  $TERMINAL \
    --config-file $HOME/repos/shortcut-fzf/alacritty-launcher-config.toml \
    -e "$HOME/repos/shortcut-fzf/shortcut-fzf.sh"
fi

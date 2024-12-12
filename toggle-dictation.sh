#!/usr/bin/env bash
# if websocat is running pkill it
pkill websocat && echo "> " && exit
echo "🔊 "
./websocat-deepgram >>content/0 2>>/dev/null &

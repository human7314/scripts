#!/bin/sh
# Send SIGRTMIN+5 to dwmblocks whenever a media player changes state.
# Assumes your signal number for the media block is 5.

signal_media() { pkill -RTMIN+5 dwmblocks 2>/dev/null; }

# Watch MPD
mpc idleloop player 2>/dev/null | while read -r _; do signal_media; done &

# Watch all MPRIS players (playerctl >= 2.0 required)
playerctl --follow status 2>/dev/null | while read -r _; do signal_media; done &

wait

#!/bin/sh
url=$(xclip -o -selection clipboard 2>/dev/null)
echo "$url" | grep -qE '^https?://' || {
    url=$(dmenu -p "URL:" < /dev/null)
    [ -z "$url" ] && exit
}
mpv "$url"

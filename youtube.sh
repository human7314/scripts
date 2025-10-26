#/bin/sh

# Check clipboard first
# url=$(xclip -o -selection clipboard)
# 
# if echo "$url" | grep -qE '^https?://'; then
#     mpv "$url"
# else
#     url=$(echo "" | dmenu -p "YouTube URL:")
#     [ -z "$url" ] && exit
#     mpv "$url"
# fi

#!/bin/sh

# Prompt for a YouTube URL using dmenu
url=$(echo "" | dmenu)

# Exit if nothing entered
[ -z "$url" ] && exit

# Play video using mpv
mpv "$url"

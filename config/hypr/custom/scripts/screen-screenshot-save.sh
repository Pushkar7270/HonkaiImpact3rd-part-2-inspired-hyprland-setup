#!/usr/bin/env bash
# Full screen -> clipboard + file
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/screenshot-$(date '+%Y-%m-%d_%H.%M%S').png"
if grim - 2>/dev/null | tee "$file" | wl-copy --type image/png; then
    notify-send "Screenshot saved" "$file" -a "Screen Snip" -i "image-x-generic"
else
    notify-send "Screenshot failed" "grim could not capture the screen" -a "Screen Snip"
fi

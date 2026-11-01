#!/usr/bin/env bash
# Full screen -> clipboard
if grim - 2>/dev/null | wl-copy --type image/png; then
    notify-send "Screenshot copied" "Full screen copied to the clipboard" -a "Screen Snip" -i "image-x-generic"
else
    notify-send "Screenshot failed" "grim could not capture the screen" -a "Screen Snip"
fi

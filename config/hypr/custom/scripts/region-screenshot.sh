#!/usr/bin/env bash
# Region screenshot -> clipboard (grim + slurp)
region="$(slurp)" || { notify-send "Screenshot failed" "No region selected" -a "Screen Snip"; exit 1; }
[ -z "$region" ] && exit 1
if grim -g "$region" - 2>/dev/null | wl-copy --type image/png; then
    notify-send "Screenshot copied" "Region copied to the clipboard" -a "Screen Snip" -i "image-x-generic"
else
    notify-send "Screenshot failed" "grim could not capture the screen" -a "Screen Snip"
fi

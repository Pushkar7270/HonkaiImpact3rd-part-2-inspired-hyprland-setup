#!/usr/bin/env bash
# Region -> OCR -> clipboard
region="$(slurp)" || { notify-send "OCR failed" "No region selected" -a "Screen Snip"; exit 1; }
[ -z "$region" ] && exit 1
tmp="$(mktemp /tmp/ocr-XXXXXX.png)"
trap 'rm -f "$tmp"' EXIT
grim -g "$region" "$tmp" 2>/dev/null || { notify-send "OCR failed" "Could not capture the screen" -a "Screen Snip"; exit 1; }
langs="$(tesseract --list-langs 2>/dev/null | awk 'NR>1{print $1}' | tr '\n' '+' | sed 's/+$//')"
text="$(tesseract "$tmp" stdout -l "$langs" 2>/dev/null)"
[ -z "$text" ] && { notify-send "OCR failed" "No text found" -a "Screen Snip"; exit 1; }
printf '%s' "$text" | wl-copy --type text/plain
notify-send "Text copied" "Recognized text is in the clipboard" -a "Screen Snip"

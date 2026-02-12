#!/usr/bin/env fish

set -l cwd (realpath (dirname (status -f)))
set -l emoji (rofi -dmenu -p 'Emoji' < $cwd/../share/dmenu-utils-fish/emoji.txt)
echo "$emoji" | cut -f1 -d' ' | wl-copy

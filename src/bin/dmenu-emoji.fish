#!/usr/bin/env fish

set -l cwd (realpath (dirname (status -f)))
set -l emoji (dmenu -p 'Emoji' < $cwd/../share/dmenu-utils-fish/emoji.txt)
string split -f 1 -m 1 "$emoji" | xclip -selection clipboard

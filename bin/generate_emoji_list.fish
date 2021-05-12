#!/usr/bin/env fish
set -l PROJECT_ROOT (git rev-parse --show-toplevel)
set -l EMOJI_LIST_SRC $PROJECT_ROOT/external/emojilib/dist/emoji-en-US.json
set -l EMOJI_LIST_DST $PROJECT_ROOT/src/share/dmenu-utils-fish/emoji.txt
jq -r 'keys[] as $k | "\($k) \(.[$k][])"' $EMOJI_LIST_SRC > $EMOJI_LIST_DST
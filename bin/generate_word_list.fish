#!/usr/bin/env fish
set -l PROJECT_ROOT (git rev-parse --show-toplevel)
set -l WORD_LIST_SRC $PROJECT_ROOT/external/english-words/words_alpha.txt
set -l WORD_LIST_DST $PROJECT_ROOT/src/share/dmenu-utils-fish/words.txt
string trim (cat $WORD_LIST_SRC) > $WORD_LIST_DST  # convert line endings

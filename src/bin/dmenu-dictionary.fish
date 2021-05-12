#!/usr/bin/env fish

set -l cwd (realpath (dirname (status -f)))
set -l word (dmenu -p 'Dictionary' < $cwd/../share/dmenu-utils-fish/words.txt)
set -l action (echo -e 'Copy\nLookup' | dmenu -p "Dictionary: $word")

switch $action
    case 'Copy'
        echo -n "$word" | xclip -selection clipboard
    case 'Lookup'
        i3-sensible-terminal -e fish -c "curl -s dict://dict.org/d:$word | less"
end

#!/usr/bin/env fish

set -l cwd (realpath (dirname (status -f)))
set -l word (rofi -dmenu -p 'Dictionary' < $cwd/../share/dmenu-utils-fish/words.txt)
set -l action (echo -e 'Lookup\nCopy' | rofi -dmenu -p "Dictionary: $word")

switch $action
    case 'Copy'
        echo -n "$word" | wl-copy
    case 'Lookup'
        rofi-sensible-terminal -e fish -c "curl -s dict://dict.org/d:$word | less"
end

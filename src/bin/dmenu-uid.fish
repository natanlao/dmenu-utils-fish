#!/usr/bin/env fish


function generate_random_uid
    set -l cwd (realpath (dirname (status -f)))
    set -l words (shuf -n 2 $cwd/../share/dmenu-utils-fish/words.txt | string join '-')
    set -l number (string pad --char 0 --width 3 (random 0 999))
    echo $words-$number
end

function generate_random_uid_diceware
    set -l words (keepassxc-cli diceware --words 2 | string split ' ' | string join '-')
    set -l salt (keepassxc-cli generate --lower --numeric --length 5)
    echo $words-$salt
end

while true
    if command -q keepassxc-cli
        set result (generate_random_uid_diceware)
    else
        set result (generate_random_uid)
    end
    set action (echo -e 'Next\nCopy to clipboard' | rofi -dmenu -p "$result")
    switch $action
        case 'Clear'
            set result ''
        case 'Copy to clipboard'
            echo $result | string trim | wl-copy
            exit
        case ''
            exit
        case '*'
            set prompt (generate_random_uid)
    end
end

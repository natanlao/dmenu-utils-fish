#!/usr/bin/env fish

set prompt ''

while true
    set answer (math "$prompt")
    set action (echo -e 'Copy to clipboard\nClear' | rofi -dmenu -p "= $answer")
    switch $action
        case 'Clear'
            set prompt ''
        case 'Copy to clipboard'
            echo $answer | wl-copy
            exit
        case ''
            exit
        case '*'
            set prompt (math "$prompt $action")
    end
end

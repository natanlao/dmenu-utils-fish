#!/usr/bin/env fish

set disk (ls /dev/disk/by-label | rofi -dmenu -p "Disk")
set output (udisksctl mount --block-device /dev/disk/by-label/$disk)

if command -q notify-send
    notify-send $output  # requires libnotify
end

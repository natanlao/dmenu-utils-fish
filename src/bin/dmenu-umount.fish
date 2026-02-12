#!/usr/bin/env fish

set disk (ls /dev/disk/by-label | rofi -dmenu -p "Disk")
set output (udisksctl unmount --block-device /dev/disk/by-label/$disk)

if command -q notify-send  # requires libnotify
    notify-send $output
end

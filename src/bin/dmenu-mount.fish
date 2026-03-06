#!/usr/bin/env fish

set disk (ls /dev/disk/by-label | grep -v boot | grep -v root | grep -v swap | rofi -dmenu -p "Disk")
set output (udisksctl mount --block-device /dev/disk/by-label/$disk)

if command -q notify-send
    notify-send $output  # requires libnotify
end

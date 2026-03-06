#!/usr/bin/env fish

set disk (ls /dev/disk/by-label | grep -v boot | grep -v root | grep -v swap | rofi -dmenu -p "Disk")
set unmount_output (udisksctl unmount --block-device /dev/disk/by-label/$disk)
set poweroff_output (udisksctl power-off --block-device /dev/disk/by-label/$disk)


if command -q notify-send  # requires libnotify
    notify-send $unmount_output

    if test $poweroff_output
        notify-send $poweroff_output
    end
end

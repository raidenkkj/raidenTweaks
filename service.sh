#!/system/bin/sh

modpath="/data/adb/modules/RTKS/"

# Wait to boot be completed
until [[ "$(getprop sys.boot_completed)" -eq "1" ]] || [[ "$(getprop dev.bootcomplete)" -eq "1" ]]; do
	sleep 1
done

# Readme
wget -qO "${modpath}storage/emulated/0/.RTKS/README.md" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/README.md"

# Download the scripts
wget -qO "${modpath}system/bin/raidentweaks" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/system/bin/raidentweaks"
wget -qO "${modpath}system/bin/raidenauto" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/system/bin/raidenauto"
wget -qO "${modpath}system/bin/rtksmenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/system/bin/rtksmenu"
wget -qO "${modpath}system/bin/lmkmenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/system/bin/lmkmenu"
wget -qO "${modpath}system/bin/cleaner" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/cleaner"
wget -qO "${modpath}system/bin/rfstrim" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/rfstrim"
wget -qO "${modpath}mod-util.sh" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/mod-util.sh"
wget -qO "${modpath}system/bin/unlockermenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/system/bin/unlockermenu"


# Fstrim every time the device reboot
rfstrim 2>/dev/null

sleep 150
raidentweaks &
cleaner

# set swappiness to 100 (zram
echo 100 > /proc/sys/vm/swappiness

# done


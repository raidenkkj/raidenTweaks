#!/system/bin/sh
#
# raidenTweaks™ is a simple kernel tweaker.
# Copyright (C) 2021~2024  Raiden Ishigami <contact.raidenishi69@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   any later version.
#
# This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.

# Mod Util
. "${modpath}"/mod-util.sh || exit $?
check_internal_storage

# Modpath
modpath="/data/adb/modules/RTKS/"

# Wait to boot be completed
until [[ "$(getprop sys.boot_completed)" -eq "1" ]] || [[ "$(getprop dev.bootcomplete)" -eq "1" ]]; do
	sleep 1
done

# Check if packages.cfg exists, if not then download it
if [[ ! -f "${internal_storage}packages.cfg" ]]; then
  wget -qO "${internal_storage}packages.cfg" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/packages.cfg"
fi

# Readme
wget -qO "/storage/emulated/0/.RTKS/README.md" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/stable/README.md"

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

# Init scripts
timeout_func
raidentweaks &
cleaner

# Set swappiness to 100% (zram)
echo 100 > /proc/sys/vm/swappiness
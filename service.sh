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

# Set internal storage var
if [[ -d "/storage/emulated/0/" ]]; then
  internal_storage="/storage/emulated/0/"
elif [[ -d "/sdcard/" ]]; then
  internal_storage="/sdcard/"
fi

# Set date var
download_date="$(date)"

# Modpath
modpath="/data/adb/modules/RTKS/"

# Wait to boot be completed
until [[ "$(getprop sys.boot_completed)" -eq "1" ]] || [[ "$(getprop dev.bootcomplete)" -eq "1" ]]; do
	sleep 1
done

# Check if packages.cfg exists, if not then download it
if [[ ! -f "${internal_storage}packages.cfg" ]]; then
  echo "Warning: The packages.cfg file was deleted by the user, and the original version has been downloaded again, resulting in the loss of any previous data." > "${internal_storage}warning.txt"
  echo "Download date: $download_date" >> "${internal_storage}warning.txt"
  wget -qO "${internal_storage}packages.cfg" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/packages.cfg"
fi

# Readme
wget -qO "/storage/emulated/0/.RTKS/README.md" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/README.md"

# Download the scripts
wget -qO "${modpath}system/bin/raidentweaks" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/system/bin/raidentweaks"
wget -qO "${modpath}system/bin/raidenauto" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/system/bin/raidenauto"
wget -qO "${modpath}system/bin/rtksmenu" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/system/bin/rtksmenu"
wget -qO "${modpath}system/bin/lmkmenu" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/system/bin/lmkmenu"
wget -qO "${modpath}system/bin/cleaner" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/cleaner"
wget -qO "${modpath}system/bin/rfstrim" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/rfstrim"
wget -qO "${modpath}mod-util.sh" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/mod-util.sh"
wget -qO "${modpath}system/bin/unlockermenu" "https://raw.githubusercontent.com/raidenkkj/raidenTweaks/stable/system/bin/unlockermenu"

# Removing raidenTweaks.apk if it exists
if [[ -f "/data/local/tmp/raidenTweaks.apk" ]]; then
  rm -rf "/data/local/tmp/raidenTweaks.apk"
fi
wget -O "/data/local/tmp/raidenTweaks.apk" "https://github.com/raidenkkj/raidenTweaks/blob/stable/raidenTweaks.apk?raw=true"

# Removing raidenToast.apk if it exists
if [[ -f "/data/local/tmp/raidenToast.apk" ]]; then
  rm -rf "/data/local/tmp/raidenToast.apk"
fi
wget -O "/data/local/tmp/raidenToast.apk" "https://github.com/raidenkkj/raidenTweaks/blob/stable/raidenToast.apk?raw=true"


# Fstrim every time the device reboot
rfstrim 2>/dev/null

# Init scripts
sleep 150
raidentweaks &
cleaner

# Set swappiness to 100% (zram)
echo 100 > /proc/sys/vm/swappiness
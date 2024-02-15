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

# Find XML files containing a specific pattern
conflict=$(xml=$(find /data/adb -iname "*.xml"); for i in $xml; do 
  if grep -q 'allow-in-power-save package="com.google.android.gms"' $i 2>/dev/null; then echo "$i";fi; done)

# Remove conflicting lines from the identified XML files
for i in $conflict; do
  sed -i '/allow-in-power-save package="com.google.android.gms"/d; /allow-in-data-usage-save package="com.google.android.gms"/d' $i
done
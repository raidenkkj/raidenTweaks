#!/bin/bash
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

# Colors
yellow=$(tput setaf 3)
green=$(tput setaf 2)
boldgreen=${bold}${green}
boldred=${bold}${red}
red=$(tput setaf 1)
blue=$(tput setaf 4)
bold=$(tput bold)
blink=$(tput blink)
default=$(tput sgr0)

# Utilities
rname=raidenTweaks
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
hour=$(date +%H)
minute=$(date +%M)
seconds=$(date +%S)
bddate=$(date +%Y-%m-%d)
outdir=$HOME/storage/downloads/builds

# Function to send a message to Telegram group
telegram_send_message() {
  local message="$1"
  message=$(echo "$message" | sed -e 's/\./\\./g' -e 's/!/\\!/g' -e 's/-/\\-/g' -e 's/\\n/\\\\n/g')
  url=$(echo "$url" | sed -e 's/\./\\./g' -e 's/!/\\!/g' -e 's/-/\\-/g' -e 's/\\n/\\\\n/g')
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" \
    -d parse_mode="MarkdownV2" > /dev/null 2>&1
}

# Function to upload file to transfer.sh
upload() {
  response=$(curl -s --upload-file "$1" https://transfer.sh/"$1")
  url=$(echo "$response" | awk -F"[ \t\n\r]+" '{print $NF}')
}

printf "\033c"
echo "${bold}${green}"
echo "|  raidenTweaks module builder  |"
echo "|      raidenkk @ telegram      |"
echo "${bold}"
read -r -p ${boldgreen}'Codename: '${blue} cdnm
read -r -p ${boldgreen}'Version: '${blue} vers
read -r -p ${boldgreen}'Version code: '${blue} vcode
read -r -p ${boldgreen}'Release type (test or rel): '${blue} release_type

init=$(date +%s)

[ "$(grep bdate $(pwd)/module.prop)" ] && sed -i -e "/bdate=/s/=.*/=$bddate/" "$(pwd)/module.prop"

[ ! "$(grep bdate $(pwd)/module.prop)" ] && echo "bdate=$bddate" >>"$(pwd)/module.prop"

sed -i -e "/version=/s/=.*/=$vers/" "$(pwd)/module.prop"
sed -i -e "/versionCode=/s/=.*/=$vcode/" "$(pwd)/module.prop"
sed -i -e "/codename=/s/=.*/=$cdnm/" "$(pwd)/module.prop"

echo "${bold}"
echo "${boldgreen}Build starting at $(date)"
echo ""

if [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "test" ]]; then
  telegram_send_message "_Test build starting for_ *_$rname-$cdnm-$year$month$day$hour$minute..._*"
elif [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "rel" ]]; then
  telegram_send_message "_Build starting for_ *_$rname-$cdnm-$year$month$day$hour$minute..._*"
fi

echo "${default}${bold}Zipping ${blink}$rname-$cdnm-$year$month$day$hour$minute..."
echo ""


zip -0 -r9 -ll "$rname-$cdnm-$year$month$day$hour$minute.zip" . -x '*.bak*' -x '*.git*' -x '*RaidenTweaks.apk*' -x '*RDToast.apk*' -x '*mod-util.sh*' -x '*fstrim*' -x '*lmkmenu*' -x '*cleaner*' -x '*changelog.md*' -x '*raidenauto*' -x '*raidentweaks*' -x '*rtksmenu*' -x '*images*' -x '*build.sh*' -x '*unlockermenu*' -x '*conf*'

if [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "test" ]]; then
  md5=$(md5sum "$rname-$cdnm-$year$month$day$hour$minute.zip" | cut -d' ' -f1)
  size=$(du -h "$rname-$cdnm-$year$month$day$hour$minute.zip" | cut -f1)
  upload "$rname-$cdnm-$year$month$day$hour$minute.zip"
  download_link="$url"
elif [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "rel" ]]; then
  md5=$(md5sum "$rname-$cdnm-$year$month$day$hour$minute.zip" | cut -d' ' -f1)
  size=$(du -h "$rname-$cdnm-$year$month$day$hour$minute.zip" | cut -f1)
  upload "$rname-$cdnm-$year$month$day$hour$minute.zip"
  download_link="$url"
fi

if [[ -d "$outdir" ]]; then
  mv -f "$rname-$cdnm-$year$month$day$hour$minute.zip" $outdir
else
  mkdir $outdir
  mv -f "$rname-$cdnm-$year$month$day$hour$minute.zip" $outdir
fi

exit=$(date +%s)

exec_time=$((exit - init))

[ $? -ne "1" ] && {
  echo ""
  echo "${boldgreen}Build done in "$((exec_time / 60))" minutes and $exec_time seconds!${blue} Check the out folder to the finished build."
  if [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "test" ]]; then
    telegram_send_message "_*raidenTweaks \| New Test Release!*_ %0A%0A*Developer:* _@raidenkk_ %0A*Release filename:* _$rname-$cdnm-$year$month$day$hour$minute.zip_ %0A*Release date:* _${bddate} ${hour}:${minute}:${seconds}_ %0A*MD5:* _${md5}_ %0A*Size:* _${size}_ %0A*Download:* _[transfer.sh](${download_link})_ %0A%0A*Join:* _@raidenprjkts_"
  elif [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "rel" ]]; then
    telegram_send_message "_*raidenTweaks \| New Test Release!*_ %0A%0A*Developer:* _@raidenkk_ %0A*Release filename:* _$rname-$cdnm-$year$month$day$hour$minute.zip_ %0A*Release date:* _${bddate} ${hour}:${minute}:${seconds}_ %0A*MD5:* _${md5}_ %0A*Size:* _${size}_ %0A*Download:* _[transfer.sh](${download_link})_ %0A%0A*Join:* _@raidenprjkts_"
  fi
  exit 0
} || {
  echo ""
  echo "${boldred}Build failed in "$((exec_time / 60))" minutes and $exec_time seconds!${yellow} Please fix the error(s) and try again."
  if [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "test" ]]; then
    telegram_send_message "_Build failed in "$((exec_time / 60))" minutes and $exec_time seconds!_"
  elif [[ "$(echo "$release_type" | tr '[:upper:]' '[:lower:]')" == "rel" ]]; then
    telegram_send_message "_Build failed in "$((exec_time / 60))" minutes and $exec_time seconds!_"
  fi
  exit 1
}

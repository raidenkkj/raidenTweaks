#!/system/bin/sh
##########################################################################################
#
# Terminal Utility Functions
# by veez21 
#
##########################################################################################

# Versions
MODUTILVER=v2.6.1
MODUTILVCODE=261

# Check A/B slot
if [[ -d /system_root ]]; then
  isABDevice=true
  SYSTEM=/system_root/system
  SYSTEM2=/system
  CACHELOC=/data/cache
else
  isABDevice=false
  SYSTEM=/system
  SYSTEM2=/system
  CACHELOC=/cache
fi
[[ -z "$isABDevice" ]] && { echo "- Something went wrong"; exit 1; }

#=========================== Set Busybox up
# Variables:
#  BBok - If busybox detection was ok (true/false)
#  _bb - Busybox binary directory
#  _bbname - Busybox name

# set_busybox <busybox binary>
# alias busybox applets
set_busybox() {
  if [[ -x "$1" ]]; then
    for i in $(${1} --list); do
      if [[ "$i" != 'echo' ]]; then
        alias "$i"="${1} $i" >/dev/null 2>&1
      fi
    done
    _busybox=true
    _bb=$1
  fi
}
_busybox=false
if [[ -n "$_bb" ]]; then
  true
elif [[ -x "$SYSTEM2"/xbin/busybox ]]; then
  _bb=$SYSTEM2/xbin/busybox
elif [[ -x "$SYSTEM2"/bin/busybox ]]; then
  _bb="$SYSTEM2"/bin/busybox
else
  false
fi
set_busybox $_bb
[[ $? -ne 0 ]] && { echo "[!] Something went wrong"; exit $?; }
[[ -n "$ANDROID_SOCKET_adbd" ]] && alias clear='echo'
_bbname="$($_bb | head -n 1 | awk '{print $1,$2}')"
BBok=true
if [[ "$_bbname" = "" ]]; then
  _bbname="[!] Busybox not found"
  BBok=false
fi

#=========================== Default Functions and Variables

# Set perm
set_perm() {
  chown "$2":"$3" "$1" || return 1
  chmod "$4" "$1" || return 1
  (if [[ -z "$5" ]]; then
    case $1 in
      *"system/vendor/app/"*) chcon 'u:object_r:vendor_app_file:s0' "$1";;
      *"system/vendor/etc/"*) chcon 'u:object_r:vendor_configs_file:s0' "$1";;
      *"system/vendor/overlay/"*) chcon 'u:object_r:vendor_overlay_file:s0' "$1";;
      *"system/vendor/"*) chcon 'u:object_r:vendor_file:s0' "$1";;
      *) chcon 'u:object_r:system_file:s0' "$1";;
    esac
  else
    chcon "$5" "$1"
  fi) || return 1
}

# Set perm recursive
set_perm_recursive() {
  find "$1" -type d 2>/dev/null | while read dir; do
    set_perm "$dir" "$2" "$3" "$4" "$6"
  done
  find "$1" -type f -o -type l 2>/dev/null | while read file; do
    set_perm "$file" "$2" "$3" "$5" "$6"
  done
}

# Mktouch
mktouch() {
  mkdir -p "${1%/*}" 2>/dev/null
  [[ -z $2 ]] && touch "$1" || echo "$2" > "$1"
  chmod 644 "$1"
}

# Grep prop
grep_prop() {
  local REGEX="s/^$1=//p"
  shift
  local FILES=$@
  [[ -z "$FILES" ]] && FILES='/system/build.prop'
  sed -n "$REGEX" $FILES 2>/dev/null | head -n 1
}

# Is mounted
is_mounted() {
  grep -q " $(readlink -f "$1") " /proc/mounts 2>/dev/null
  return $?
}

# Abort
abort() {
  echo "$1"
  exit 1
}

# Device Info
# Variables: BRAND MODEL DEVICE API ABI ABI2 ABILONG ARCH
BRAND=$(getprop ro.product.brand)
MODEL=$(getprop ro.product.model)
DEVICE=$(getprop ro.product.device)
ROM=$(getprop ro.build.display.id)
API=$(grep_prop ro.build.version.sdk)
ABI=$(grep_prop ro.product.cpu.abi | cut -c-3)
ABI2=$(grep_prop ro.product.cpu.abi2 | cut -c-3)
ABILONG=$(grep_prop ro.product.cpu.abi)
ARCH=arm
ARCH32=arm
IS64BIT=false
if [[ "$ABI" = "x86" ]]; then ARCH=x86; ARCH32=x86; fi;
if [[ "$ABI2" = "x86" ]]; then ARCH=x86; ARCH32=x86; fi;
if [[ "$ABILONG" = "arm64-v8a" ]]; then ARCH=arm64; ARCH32=arm; IS64BIT=true; fi;
if [[ "$ABILONG" = "x86_64" ]]; then ARCH=x64; ARCH32=x86; IS64BIT=true; fi;
  
# Version Number
VER=$(grep_prop version "$MODDIR"/module.prop)
# Version Code
REL=$(grep_prop versionCode "$MODDIR"/module.prop)
# Author
AUTHOR=$(grep_prop author "$MODDIR"/module.prop)
# Mod Name/Title
MODT=$(grep_prop name "$MODDIR"/module.prop)
# Mod Codename
CODNM=$(grep_prop codename "$MODDIR"/module.prop)

# Colors
G='\e[01;32m'		# GREEN TEXT
R='\e[01;31m'		# RED TEXT
Y='\e[01;33m'		# YELLOW TEXT
B='\e[01;34m'		# BLUE TEXT
V='\e[01;35m'		# VIOLET TEXT
Bl='\e[01;30m'		# BLACK TEXT
C='\e[01;36m'		# CYAN TEXT
W='\e[01;37m'		# WHITE TEXT
BGBL='\e[1;30;47m'	# Background W Text Bl
N='\e[0m'			# How to use (example): echo "${G}example${N}"
loadBar=' '			# Load UI
# Remove color codes if -nc or in ADB Shell
[[ -n "$1" ]] && [[ "$1" = "-nc" ]] && shift && NC=true
[[ "$NC" ]] || [[ -n "$ANDROID_SOCKET_adbd" ]] && {
  G=''; R=''; Y=''; B=''; V=''; Bl=''; C=''; W=''; N=''; BGBL=''; loadBar='=';
}

# No. of characters in $MODTITLE, $VER, and $REL
character_no=$(echo "$MODTITLE $VER $REL" | wc -c)

# Divider
div="${Bl}$(printf '%*s' "${character_no}" '' | tr " " "=")${N}"

# title_div [-c] <title>
# based on $div with <title>
title_div() {
  [[ "$1" = "-c" ]] && local character_no=$2 && shift 2
  [[ -z "$1" ]] && { local message=; no=0; } || { local message="$@ "; local no=$(echo "$@" | wc -c); }
  [[ $character_no -gt $no ]] && local extdiv=$((character_no-no)) || { echo "Invalid!"; return 1; }
  echo "${W}$message${N}${Bl}$(printf '%*s' "$extdiv" '' | tr " " "=")${N}"
}

# set_file_prop <property> <value> <prop.file>
set_file_prop() {
  if [[ -f "$3" ]]; then
    if grep -q "$1=" "$3"; then
      sed -i "s/${1}=.*/${1}=${2}/g" "$3"
    else
      echo "$1=$2" >> "$3"
    fi
  else
    echo "- $3 doesn't exist"; return 1
  fi
}

# https://github.com/fearside/ProgressBar
# ProgressBar <progress> <total>
ProgressBar() {
# Determine Screen Size
  if [[ "$COLUMNS" -le "57" ]]; then
    local var1=2
	local var2=20
  else
    local var1=4
    local var2=40
  fi
# Process data
  local _progress=$(((${1}*100/${2}*100)/100))
  local _done=$(((${_progress}*${var1})/10))
  local _left=$((${var2}-$_done))
# Build progressbar string lengths
  local _done=$(printf "%${_done}s")
  local _left=$(printf "%${_left}s")

# Build progressbar strings and print the ProgressBar line
printf "\rProgress : ${BGBL}|${N}${_done// /${BGBL}$loadBar${N}}${_left// / }${BGBL}|${N} ${_progress}%%"
}

#https://github.com/fearside/SimpleProgressSpinner
# Spinner <message>
Spinner() {

# Choose which character to show.
case ${_indicator} in
  "|") _indicator="/";;
  "/") _indicator="-";;
  "-") _indicator="\\";;
  "\\") _indicator="|";;
  # Initiate spinner character
  *) _indicator="\\";;
esac

# Print simple progress spinner
printf "\r${@} [${_indicator}]"
}

# cmd & spinner <message>
e_spinner() {
  PID=$!
  h=0; anim='-\|/';
  while [[ -d /proc/$PID ]]; do
    h=$(((h+1)%4))
    sleep 0.02
    printf "\r${@} [${anim:$h:1}]"
  done
}

# test_connection
# tests if there's internet connection
test_connection() {
  (
  if ping -q -c 1 -W 1 google.com >/dev/null 2>&1; then
    true
  elif ping -q -c 1 -W 1 baidu.com >/dev/null 2>&1; then
    true
  else
    false
  fi & echo "${G}[*] - Testing if you are connected to an internet...${N}"
  ) && echo "" && echo "${G}[*] - Done, all right.${N}" || { echo "" && echo "${R}[*] - You are not connected to the internet!${N}"; false; }
}


# Log files will be uploaded to termbin.com
# Logs included: VERLOG LOG oldVERLOG oldLOG
upload_logs() {
  $BBok && {
    test_connection || exit
    echo ""
    echo "${G}[*] - Uploading logs, wait.${N}"
    echo ""
    [[ -s $VERLOG ]] && verUp=$(cat "$VERLOG" | nc termbin.com 9999) || verUp=none
    [[ -s $oldVERLOG ]] && oldverUp=$(cat "$oldVERLOG" | nc termbin.com 9999) || oldverUp=none
    [[ -s $RLOG ]] && logUp=$(cat "$RLOG" | nc termbin.com 9999) || logUp=none
    [[ -s $oldLOG ]] && oldlogUp=$(cat "$oldLOG" | nc termbin.com 9999) || oldlogUp=none
    [[ -s $stdoutLOG ]] && stdoutUp=$(cat "$stdoutLOG" | nc termbin.com 9999) || stdoutUp=none
    [[ -s $oldstdoutLOG ]] && oldstdoutUp=$(cat "$oldstdoutLOG" | nc termbin.com 9999) || oldstdoutUp=none
    echo -n "${C}[*] - Link: ${BGBL}"
    echo "$MODEL ($DEVICE) API $API \n$ROM \r$MODT - $CDNM
    
    rT-log: $logUp
    O_rT: $oldlogUp
    
    Verbose: $verUp
    O_Verbose: $oldverUp

    STDOUT: $stdoutUp
    O_STDOUT: $oldstdoutUp" | nc termbin.com 9999
    
  } || echo "${R}[*] - You are not using busybox, why?"
}

# Print Random
# Prints a message at random
# CHANCES - no. of chances <integer>
# TARGET - target value out of CHANCES <integer>
prandom() {
  local CHANCES=2
  local TARGET=2
  [[ "$1" =  "-c" ]] && { local CHANCES=$2; local TARGET=$3; shift 3; }
  [[ "$((RANDOM%CHANCES+1))" -eq "$TARGET" ]] && echo "$@"
}

# Print Center
# Prints text in the center of terminal
pcenter() {
  local CHAR=$(printf "$@" | sed 's|\\e[[0-9;]*m||g' | wc -m)
  local hfCOLUMN=$((COLUMNS/2))
  local hfCHAR=$((CHAR/2))
  local indent=$((hfCOLUMN-hfCHAR))
  echo "$(printf '%*s' "${indent}" '') $@"
}

# Help text
# Shows help text with important information
help_text() {
  echo ""
  echo "${Y}$MODT $VER($REL)"
  echo "by ${B}$AUTHOR${N}"
  echo "${Y}Usage: ${B}$_name${N}"
  echo "${Y}or: ${B}$_name [options]...${N}"
  echo "${Y}Telegram group: ${B}https://t.me/raidenprjktsgroup${N}"
  echo ""
  echo "${Y}Options:${N}"
  echo "${Y}  -p --profile ${B}[1-6] [Switch between profiles without opening the terminal GUI, for a fast and seamless experience]${N}"
  echo "${Y}  -c --clear-ram ${B}[1-3] [Higher value means more agressive memory reclaim, which includes killing apps at maximum value (3)]${N}"
  echo "${Y}  -t --thermal ${B}[enable|disable] [Disables or enables the thermal]${N}"
  echo "${Y}  -u --update-all ${B}[Update module scripts to the latest available version]${N}"
  echo "${Y}  -d --downsample ${B}[apply|restore] ${N}"
  echo "${Y}    apply ${B}[Apply downsampling to reduce screen resolution by a factor of 2]${N}"
  echo "${Y}    restore ${B}[Restore original screen resolution]${N}"
  echo "${Y}  -h --help ${B}[Show this message]${N}"
  echo ""
  exit 0
}

# Update all
# Updates all module files
updateall() {
  commondir="/data/adb/modules/RTKS/"
  updatedir="/data/adb/modules_update/RTKS/"
  branch="$(grep_prop dbranch "$modpath"module.prop)"

  if [[ -d "$commondir" ]]; then
    modpath="/data/adb/modules/RTKS/"
  elif [[ -d "$updatedir" ]]; then
    modpath="/data/adb/modules_update/RTKS/"
  fi

  if [[ "$branch" == stable ]]; then
    dbranch=stable
  elif [[ "$branch" == beta ]]; then
    dbranch=beta
  elif [[ "$branch" == tests ]]; then
    dbranch=tests
  else
    dbranch=stable
  fi

  echo ""
  echo "$G[*] - Downloading the latest script(s) / application from GitHub...$N"
  echo ""
  wget -qO "${modpath}system/bin/raidentweaks" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/system/bin/raidentweaks"
  wget -qO "${modpath}system/bin/raidenauto" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/system/bin/raidenauto"
  wget -qO "${modpath}system/bin/rtksmenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/system/bin/rtksmenu"
  wget -qO "${modpath}system/bin/lmkmenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/system/bin/lmkmenu"
  wget -qO "${modpath}system/bin/unlockermenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/system/bin/unlockermenu"
  wget -qO "${modpath}system/bin/cleaner" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/cleaner"
  wget -qO "${modpath}system/bin/rfstrim" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/rfstrim"
  wget -qO "${modpath}mod-util.sh" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/$dbranch/mod-util.sh"
  wget -qO "/data/local/tmp/RaidenTweaks.apk" "https://github.com/raidenkkj/Raiden-Tweaks/blob/stable/RaidenTweaks.apk?raw=true"
  wget -qO "/data/local/tmp/RDToast.apk" "https://github.com/raidenkkj/Raiden-Tweaks/blob/stable/RDToast.apk?raw=true"

  echo ""
  echo "$G[*] - Uninstalling old (if u have) and installing new version of the main application..$N."
  echo ""
  if [[ "$(pm list package org.rtks.raiden)" ]]; then
    pm uninstall -k --user 0 org.rtks.raiden
  elif [ "$(pm list package com.raidentweaks)" ]; then
    pm uninstall -k --user 0 com.raidentweaks
  fi

  pm install /data/local/tmp/RaidenTweaks.apk

  echo ""
  echo "$G[*] - Uninstalling old (if u have) and installing new version of the toast application...$N"
  if [ "$(pm list package bellavita.toast)" ]; then
    echo ""
    pm uninstall -k --user 0 bellavita.toast
  fi

  pm install /data/local/tmp/RDToast.apk
  echo ""

  echo "$G[*] - Setting permissions...$N"
  chmod 755 ${modpath}system/bin/*
  echo "$G[*] - Done, now the device will be rebooted!$N"
  sleep 5
  reboot system
}

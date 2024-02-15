# Remove specific files and uninstall certain packages if a file exists
if [[ -e "/sdcard/.RTKS" ]]; then
  rm -rf /sdcard/.RTKS
  rm -rf /data/local/tmp/RaidenTweaks.apk
  rm -rf /data/local/tmp/RDToast.apk
  pm uninstall -k --user 0 org.rtks.raiden
  pm uninstall -k --user 0 bellavita.toast
fi

# Check if a file exists, then perform operations based on its content
if [ -f $INFO ]; then
  while read LINE; do
    if [ "$(echo -n $LINE | tail -c 1)" == "~" ]; then
      continue
    elif [ -f "$LINE~" ]; then
      mv -f $LINE~ $LINE
    else
      rm -f $LINE
      while true; do
        LINE=$(dirname $LINE)
        [ "$(ls -A $LINE 2>/dev/null)" ] && break 1 || rm -rf $LINE
      done
    fi
  done < $INFO
  rm -f $INFO
fi
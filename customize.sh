# List of directories to be replaced (example)
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# List of replacements
REPLACE="
"

# Function to set permissions
set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/system/bin root root 0777 0755
}

# Skip unzipping
SKIPUNZIP=1

# Unzip functions.sh file and include it
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
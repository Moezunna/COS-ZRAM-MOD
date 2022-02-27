#=============================#
# < NICKMOD = COS-ZRAM-MOD    #
# < VERSION = In the filename #
# < DATE = 14-02-2022         #
#=============================#

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
/sys/block/zram0/disksize
"

set_permissions() {
  set_perm_recursive $MODPATH/sys/block/zram0/disksize 0 0 0755 0644
}

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh


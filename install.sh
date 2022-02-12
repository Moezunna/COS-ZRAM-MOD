print_modname() {
  ui_print "۩▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬۩"
  sleep 0
  ui_print " ========================================="
  ui_print "=          COSTUM MODULE BY MoeZu         ="
  ui_print "=!!Approximately install only 1 minute!!  ="
  ui_print " ========================================="
  #Loading
  ui_print "Loading..."
  ui_print " "
  ui_print "*************************************"
  ui_print " ID               =$MODID            "
  ui_print " name             =$MODNAME          "
  ui_print " MagiskVersion    =$MAGISK_VER       "
  ui_print " MagiskVersionCode=$MAGISK_VER_CODE  "
  ui_print " Module_Verison   =vTwO              "
  ui_print " Min_magisk       =23.0              "
  ui_print "*************************************"
  ui_print " "
  sleep 5
  ui_print "۩▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬۩"
echo "After Install Check Your Zram"
echo " "
sleep 5
echo "Installation Completed"
echo " "
sleep 3
ui_print "Reboot For Perfect Completed!!"
}

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


#COSTUM BY MOEZU
sleep 10
echo 2048M >/sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon  /dev/block/zram0


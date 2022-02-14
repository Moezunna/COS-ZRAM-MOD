#=============================#
# < NICKMOD = COS-EXP-MOD     #
# < VERSION = In the filename #
# < DATE = 13-02-2022         #
#=============================#

#COSTUM BY MOEZU

# Zram Old To New Suppot MIUI OS
echo 524288K > /sys/block/zram0/disksize
echo 512M > /sys/block/zram0/disksize
#cho G > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0
mkfs.ext4 /dev/zram1
mount /dev/zram1 /tmp

for vm in /proc/sys/vm/
do
if [[ -d "/proc/sys/vm" ]]
then
write "${vm}drop_caches" "6"
write "${vm}dirty_background_ratio" "100"
write "${vm}dirty_ratio" "100"
write "${vm}dirty_expire_centisecs" "6000"
write "${vm}dirty_writeback_centisecs" "6000"
write "${vm}page-cluster" "0"
write "${vm}stat_interval" "10"
write "${vm}swappiness" "200"
write "${vm}swap_ratio_enable" "1"
write "${vm}swap_ratio" "200"
write "${vm}vfs_cache_pressure" "200"

settings put global activity_manager_constants max_cached_processes=160

stop perfd
echo '160' > /proc/sys/vm/swappiness
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo '100' > /proc/sys/vm/vfs_cache_pressure
echo '4096' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '4096' > /sys/block/mmcblk1/queue/read_ahead_kb
echo '8000' > /proc/sys/vm/min_free_kbytes
echo '0' > /proc/sys/vm/oom_kill_allocating_task
echo '100' > /proc/sys/vm/dirty_ratio
echo '100' > /proc/sys/vm/dirty_background_ratio
chmod 1032 /sys/module/lowmemorykiller/parameters/minfree
chown root /sys/module/lowmemorykiller/parameters/minfree
echo '38912,40960,43008,45056,47104,49152' > /sys/module/lowmemorykiller/parameters/minfree
rm /data/system/perfd/default_values
start perfd
sleep 10


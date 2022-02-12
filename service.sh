#COSTUM BY MOEZU

# Zram Old To New
sleep 10
echo 4096M >/sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0

echo 4194304K > /sys/block/zram0/disksize
echo 4096M > /sys/block/zram0/disksize
echo 4G > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0
mkfs.ext4 /dev/zram1
mount /dev/zram1 /tmp


{ # Zram New Test Add Work Or Not 
    	echo 3 > /sys/block/zram0/max_comp_streams
	if [ $? -ne 0 ];
		handle_error
	fi
}

modprobe zram num_devices=0
{
echo cat /sys/block/zram0/max_comp_streams
    #show supported compression algorithms
echo cat /sys/block/zram0/comp_algorithm
lzo [lz4]

	#select lzo compression algorithm
echo lzo > /sys/block/zram0/comp_algorithm
}

	# Initialize /dev/zram0 with 50MB disksize
echo $((50*4096*4096)) > /sys/block/zram0/disksize

	# Using mem suffixes
echo 4194304K > /sys/block/zram0/disksize
echo 4096M > /sys/block/zram0/disksize
echo 4G > /sys/block/zram0/disksize
}

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


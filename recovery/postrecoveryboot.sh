#!/sbin/sh
/sbin/watchdogd &
echo "Y" > /sys/module/intel_mid/parameters/force_cold_boot
exit 0

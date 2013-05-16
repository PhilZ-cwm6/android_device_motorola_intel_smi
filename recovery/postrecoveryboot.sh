#!/sbin/sh

# Of course the watchdog feeder is required for our phone!
/sbin/watchdogd &

# The following are some performance and brightness settings that we can overr-
# -ide in order to save power during recovery and let the phone get less hot
echo 40 > /sys/class/backlight/psb-bl/brightness
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "95" > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo "2000000" > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo "120000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "60000" > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo "90000" > /sys/devices/system/cpu/cpufreq/interactive/timer_rate

#!/sbin/sh

# Of course the watchdog feeder is required for our phone!
/sbin/watchdogd &

# The following are some performance and brightness settings that we can overr-
# -ide in order to save power during recovery and let the phone get less hot
echo 40 > /sys/class/backlight/psb-bl/brightness
echo "smartassV2" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor


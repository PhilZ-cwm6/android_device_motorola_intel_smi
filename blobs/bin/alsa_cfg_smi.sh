#!/system/bin/mksh

/system/bin/toolbox rm /data/alsa/asound.conf &> /dev/null

/system/bin/isP12
if [ $? -eq 0 ]; then
	#return value 0; unit is either not SMi or not P1 or P2
	/system/bin/toolbox ln -s /system/etc/asound_p3.conf /data/alsa/asound.conf
else
	#Unit is SMi P1 ($? == 1) or P2 ($? == 2)
	/system/bin/toolbox ln -s /system/etc/asound_p1.conf /data/alsa/asound.conf
fi

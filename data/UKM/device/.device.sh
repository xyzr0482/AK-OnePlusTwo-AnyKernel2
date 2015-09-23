#!/system/bin/sh

UKM=/data/UKM;
BB=$UKM/busybox;
DEVPROP="ro.product.device";
DEVICE=`getprop "$DEVPROP" 2> /dev/null`;

if [ -z "$DEVICE" ]; then DEVICE=`$BB grep "$DEVPROP=" /system/build.prop | $BB cut -d= -f2`; fi;

#Official
case $DEVICE in
	bacon|A0001)
		CONFIG="bacon";; #OnePlus One
	OnePlus2|A2001|A2003|A2005)
		CONFIG="oneplus2";; #OnePlus Two
	*)
		CONFIG="";; #Not defined
esac;

if [ -n "$CONFIG" ]; then PATH="$UKM/device/$CONFIG.sh"; else PATH=""; fi;

$BB echo "$PATH";

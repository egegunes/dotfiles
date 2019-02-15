#!/bin/bash

BAT=BAT0

if [ -d /sys/class/power_supply/$BAT ];
then
    now=`cat /sys/class/power_supply/$BAT/charge_now`
    full=`cat /sys/class/power_supply/$BAT/charge_full`
    out=`echo $now/$full*100 | bc -l | cut -c 1-5`
    printf " %.f%%" $out
else
    echo ""
fi

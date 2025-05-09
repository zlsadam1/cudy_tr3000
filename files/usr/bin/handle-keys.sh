#!/bin/sh

while true; do
    evtest /dev/input/event0 | while read line; do
        if echo "$line" | grep -q "type 1 (EV_KEY), code 373 (KEY_MODE)"; then
            if echo "$line" | grep -q "value 1"; then
                echo "Slider switch turned ON - Enabling Wi-Fi"
                logger "Slider switch turned ON - Enabling Wi-Fi"
                wifi up
                echo 1 > /sys/class/leds/white:status/brightness
                echo 0 > /sys/class/leds/red:power/brightness
            elif echo "$line" | grep -q "value 0"; then
                echo "Slider switch turned OFF - Disabling Wi-Fi"
                logger "Slider switch turned OFF - Disabling Wi-Fi"
                wifi down
                echo 0 > /sys/class/leds/white:status/brightness
                echo 1 > /sys/class/leds/red:power/brightness
            fi
        elif echo "$line" | grep -q "type 1 (EV_KEY), code 408 (KEY_RESTART)"; then
            if echo "$line" | grep -q "value 1"; then
                echo "Reset button pressed"
                logger "Reset button pressed"
                reboot
            fi
        fi
    done
done

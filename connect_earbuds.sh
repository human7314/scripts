#!/bin/sh

bluetoothctl connect 9C:DE:F0:AF:1E:5D
sleep 3

wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.50

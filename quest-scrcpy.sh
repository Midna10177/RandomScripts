#!/usr/bin/bash
adb connect $(cat ~/.ssh/config | grep quest | rev | cut -d ' ' -f 1 | rev )
scrcpy --crop 1832:1920:0:0 -m 320 --fullscreen --no-audio --stay-awake --video-bit-rate 3M --max-fps 25 --display-buffer 200

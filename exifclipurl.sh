#!/data/data/com.termux/files/usr/bin/bash

mkfifo img

wget -q $(termux-clipboard-get) -O img &
exiftool img

rm img

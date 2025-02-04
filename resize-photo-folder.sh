#!/data/data/com.termux/files/usr/bin/bash
dir="vrc-resized/photos"
mkdir -p $dir
find "$*" -maxdepth 1 -type f -exec sh -c 'resize-photo.sh $0; mv $0-resized.png vrc-resized/photos/' "{}" \;

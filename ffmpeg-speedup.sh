#!/data/data/com.termux/files/usr/bin/bash
pushd $PREFIX/tmp
mkfifo raw.h264
ffmpeg -i $1 -map 0:v -c:v copy -bsf:v h264_mp4toannexb -y raw.h264 &
#ffmpeg -i $* -map 0:v -c:v copy -bsf:v hevc_mp4toannexb raw.h265 &
ffmpeg -fflags +genpts -r $2 -i raw.h264 -c:v copy -y output.mp4
rm raw.h264
popd

mv $PREFIX/tmp/output.mp4 ./

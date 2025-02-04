
#-ac 1
#-af "asplit[a],aphasemeter=video=0,ametadata=select:key=lavfi.aphasemeter.phase:value=-0.005:function=less,pan=1c|c0=c0,aresample=async=1:first_pts=0,[a]amix"
while true
do
 ffmpeg -i $(yt-dlp -f bestaudio -g $(termux-clipboard-get)) -ac 1 -f opus - | mpv -
 #mpv $(yt-dlp -f bestaudio -g $(termux-clipboard-get))
 sleep 1
done

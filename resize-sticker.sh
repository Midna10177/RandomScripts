ffmpeg -i "$*" -vf "scale=1024:1024:force_original_aspect_ratio=1,format=rgba,pad=1024:1024:(( (ow - iw)/2 )):(( (oh - ih)/2 )):color=#00000000" -y "$*-resized.png"

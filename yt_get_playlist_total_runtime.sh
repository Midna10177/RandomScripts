#!/data/data/com.termux/files/usr/bin/bash

timestamp_to_seconds(){
# delimiter_count=$(grep -o ':' <<<"$*" | grep -c .)
# if   [ $delimiter_count -eq 3 ]; then
  echo $* | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'
# elif [ $delimiter_count -eq 2 ]; then
#  echo $* | awk -F: '{ print ($2 * 60) + $3 }'
# else
#  echo $* | awk -F: '{ print $3 }'
# fi
}

seconds_to_timestamp(){
 echo $*
}

while IFS= read -r line; do
 sum=$[ $sum + $(timestamp_to_seconds $line) ]
 done < <(yt-dlp --get-duration --yes-playlist $*)
echo sum: $(seconds_to_timestamp $sum)

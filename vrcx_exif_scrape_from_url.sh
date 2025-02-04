#!/data/data/com.termux/files/usr/bin/bash
pushd $PREFIX/tmp > $PREFIX/tmp/null

mkfifo img

wget -q $* -O img &
exiftool -json img | jq '.[0].Description' -r > data

cat data | jq '.players'
cat data | jq '.world'

rm img data

popd > $PREFIX/tmp/null

rm $PREFIX/tmp/null

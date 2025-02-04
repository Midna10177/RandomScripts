#!/bin/bash
pushd /tmp > /dev/null

mkfifo img

wget -q $* -O img &
exiftool -json img | jq '.[0].Description' -r > data

cat data | jq '.players'
cat data | jq '.world'

rm img data

popd > /dev/null


#!/data/data/com.termux/files/usr/bin/zsh
# Asks a series of questions and then returns an image
# use like "bash catchphrase.sh"
echo "What is your favorite color?"
read theColor
echo "What is your catchphrase?"
read thePhrase

convert -size 1000x1000 xc:$theColor +repage \
 -size 800x800  -fill white -background None  \
 -font CourierNewB -gravity center caption:"$thePhrase" +repage \
 -gravity Center  -composite -strip  catchphraseimage.jpg

echo "See your special image at ${PWD}/catchphraseimage.jpg"

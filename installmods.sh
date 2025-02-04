#!/data/data/com.termux/files/usr/bin/bash
#
# Automatically unzips any zips in the current dir
#   to the bonelabs mods directory
#
#               - made by yours truly

#MODS_DIR="/data/data/com.termux/files/home/storage/shared/Android/data/com.StressLevelZero.BONELAB/files/Mods"
MODS_DIR="/storage/emulated/0/Android/data/com.StressLevelZero.BONELAB/files/Mods"


for i in ./*.zip
 do
   unzip "$i" -d "$MODS_DIR"
 done

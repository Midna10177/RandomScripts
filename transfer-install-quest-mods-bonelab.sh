#!/data/data/com.termux/files/usr/bin/bash
scp *.zip quest:~/ && rm *.zip && ssh quest './installmods.sh && rm *.zip && ls'

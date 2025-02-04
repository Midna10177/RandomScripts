#!/usr/bin/bash
pushd /run/media/renny/BackupDrive

gallery-dl 'https://e621.net/posts?tags=status%3Aflagged+score%3A%3E3+ischild%3Afalse+isparent%3Afalse' --sleep-request 2 --sleep 2 --user-agent 'gallery-dl_favorite_backup_script/1.0 (by renard10177 on e621)' $*
popd

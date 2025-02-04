#!/usr/bin/bash
#potential fixes from https://forum.manjaro.org/t/howto-troubleshoot-crackling-in-pipewire/82442
#i didnt create a backup of the original 50-alsa-config.lua so i might be fucked
#
#i changed the 'headroom' from 0 to 1024
#and changed the 'period-size' from 1024 to 256
systemctl --user restart pipewire pipewire-pulse pipewire-media-session

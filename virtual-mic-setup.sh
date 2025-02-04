#!/usr/bin/bash
# creates a device where AudioRelay can stream audio into.
#pactl load-module module-null-sink \
#	sink_name=audiorelay-virtual-mic-sink \
#	sink_properties=device.description=Virtual-Mic-Sink
#
# creates a device where AudioRelay can stream audio into.
#pactl load-module module-remap-source \
#	master=audiorelay-virtual-mic-sink.monitor \
#	source_name=audiorelay-virtual-mic-sink \
#	source_properties=device.description=Virtual-Mic
#
#echo restarting pipewire and pipewire-pulse
#sleep 2;
#systemctl --user restart pipewire pipewire-pulse
pw-loopback -m '[ FL FR ]' --capture-props='media.class=Audio/Sink node.name=my_sink' --playback-props='node.target="my-default-sink"'


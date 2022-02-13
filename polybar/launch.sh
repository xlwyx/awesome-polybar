#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/nul; do sleep 1; done

# Launch bar
polybar tx &

if [[$(xrandr -q | grep "HDMI connected")]]; then
	polybar top_external &
fi


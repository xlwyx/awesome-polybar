#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/nul; do sleep 1; done

# Launch bar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload lwy &
  done
else
  polybar --reload top_external &
fi

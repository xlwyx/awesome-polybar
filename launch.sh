#!/usr/bin/env bash

# Terminate already running bar instances
·killall -q polybar

# For wait until the process is down
while grep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar tx 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."


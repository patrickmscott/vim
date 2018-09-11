#!/bin/bash
export DISPLAY=:0.0

xrandr | grep "DP-1-2 connected"
if [[ $? == 0 ]]; then
  # Connected
  xrandr --output eDP-1 --auto
  xrandr --output DP-1-1 --set "Broadcast RGB" "Full"
  xrandr --output DP-1-2 --set "Broadcast RGB" "Full"
  xrandr --output DP-1-1 --auto --same-as eDP-1 --primary
  xrandr --output DP-1-2 --auto --right-of DP-1-1
else
  # Disconnect
  xrandr --auto 
  xrandr --output eDP-1 --primary
fi

# Restart i3 so that the primary display is detected
i3-msg restart

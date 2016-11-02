#!/bin/bash
export DISPLAY=:0.0

xrandr | grep "HDMI2 connected"
if [[ $? == 0 ]]; then
  # Connected
  xrandr --output eDP1 --auto
  xrandr --output DP1 --set "Broadcast RGB" "Full"
  xrandr --output HDMI2 --set "Broadcast RGB" "Full"
  xrandr --output DP1 --auto --same-as eDP1 --primary
  xrandr --output HDMI2 --auto --right-of DP1
else
  # Disconnect
  xrandr --auto
  xrandr --output eDP1 --primary
fi

# Restart i3 so that the primary display is detected
i3-msg restart

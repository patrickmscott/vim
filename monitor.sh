#!/bin/bash
export DISPLAY=:0.0

xrandr | grep "HDMI1 connected"
if [[ $? == 0 ]]; then
  # Connected
  xrandr --output HDMI1 --auto --same-as eDP1 --primary
  xrandr --output HDMI2 --auto --right-of HDMI1
else
  # Disconnect
  xrandr --output eDP1 --primary
fi

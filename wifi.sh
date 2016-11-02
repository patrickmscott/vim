#!/bin/bash

nmcli r wifi | grep enabled
if [[ $? == 0 ]]; then
  nmcli r wifi off
else
  nmcli r wifi on
fi

killall -SIGUSR1 i3status

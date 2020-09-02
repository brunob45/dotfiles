#!/usr/bin/env bash

killall -9 polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  PRIMARY=$(xrandr --query | grep " primary" | cut -d" " -f1)
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$PRIMARY" = "$m" ]; then
      MONITOR=$m polybar primary &
    else
      MONITOR=$m polybar secondary &
    fi
  done
else
  polybar primary &
fi

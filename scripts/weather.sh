#!/usr/bin/env bash

line=$(curl fr.wttr.in/\?format="%c%t\n" 2>/dev/null | sed "s/\+//")
echo "$line" | grep "Unknown location;" >/dev/null

if [ "$?" -eq 0 ]; then
    echo "🌦󰜺"
else
    echo "$line"
fi

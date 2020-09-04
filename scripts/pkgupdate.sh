#!/usr/bin/env bash

message=""
available=0

check() {
  echo "󰑐"
  pkgs=$(checkupdates 2>/dev/null)
  code=$?

  if [ "$code" = 0 ]; then
    # Updates available
    message="󰏖$(echo "$pkgs" | wc -l)"
    available=1

  elif [ "$code" = 2 ]; then
    # No update available
    message="󰏗"
    available=0

  else
    # Error
    message="󰜺"
    available=0
  fi
}

update() {
  pkill -P $$ -x sleep
  echo "󰑐"

  if [ $available = 1 ]; then
    sudo pacman -Syu --noconfirm 2>&1 >/dev/null

    if [ "$?" ]; then
      # Error
      echo "󱈸$message"
      sleep 5
    fi
  fi
}

trap "update" USR1

while :
do
  check
  echo "$message"

  sleep 600 &
  wait
done

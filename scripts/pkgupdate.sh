#!/usr/bin/env bash

message=""
available=0

check() {
  echo "󰑐"
  pkgs=$(checkupdates 2>/dev/null)
  code=$?

  if [ "$code" -eq 0 ]; then
    # Updates available
    message="󰏖$(echo "$pkgs" | wc -l)"
    available=1

  elif [ "$code" -eq 2 ]; then
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

  # if [ $available = 1 ]; then
  #   echo "󰑐"
  #   sudo pacman -Syu --noconfirm 2>&1 >/dev/null

  #   if [ "$?" -ne 0 ]; then
  #     # Error
  #     echo "󱈸$message"
  #     sleep 5
  #   fi
  # fi
}

trap "update" USR1

while :
do
  check
  echo "$message"

  sleep 600 &
  wait
done

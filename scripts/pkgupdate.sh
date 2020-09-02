#!/usr/bin/env bash

if type "checkupdates" >/dev/null; then
  checkupdates 2>/dev/null
  code=$?
  if [ "$code" = 0 ]; then
    echo "󰏖"
  else
    if [ "$code" = 2 ]; then
      echo "󰏗"
    else
      echo "󰜺"
    fi
  fi
fi

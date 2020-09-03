#!/usr/bin/env bash

icon="$HOME/images/bg_black_small.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" \
  -scale 10% \
  "$icon" -gravity center -composite \
  -sample 1000% \
  "$tmpbg"

i3lock -n -i "$tmpbg" --line-uses-inside \
  --indpos="x+1550:y+150" --radius=100 \
  --keyhlcolor=000000ff --bshlcolor=000000ff --separatorcolor=ffffffff \
  --indicator --clock --timecolor=ffffffff --timestr="%H:%M" \
  --datecolor=ffffffff  --datestr="%a %d %B" \
  --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 \
  --ringcolor=ffffffff --ringvercolor=005000ff --ringwrongcolor=500000ff \
  --veriftext="Vérification" --verifcolor=ffffffff --verifpos="ix+0:iy+8" \
  --wrongtext="Incorrect" --wrongcolor=ffffffff --wrongpos="ix+0:iy+8"

rm $tmpbg

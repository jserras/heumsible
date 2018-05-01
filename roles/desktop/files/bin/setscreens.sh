#!/bin/bash

# build virtual width
VWIDTH=0;
for i in $(xrandr -q | grep '[ \*]+'| grep -v "+.Sync" | awk '{print $1}' | cut -d 'x' -f 1); do
  VWIDTH=$((VWIDTH + i))
done
# echo "$VWIDTH"

# get maximal height
VHEIGHT=0;
for i in $(xrandr -q | grep '[ \*]+'| grep -v "+.Sync" | awk '{print $1}' | cut -d 'x' -f 2); do
  if [ "$VHEIGHT" -lt "$i" ] ; then
    VHEIGHT=$i
  fi
done
# echo "$VHEIGHT"

# build screenlist
SLIST=""
SLAST="eDP-1"

for i in $(xrandr -q |grep -o "^.* connected"  |awk '{print $1}'| sort); do
  if [ "$i" == "eDP-1" ]; then
    SLIST=" --output $i --primary --auto $SLIST "
  else
    SLIST="$SLIST --output $i --right-of $SLAST --auto "
    SLAST="$i"
  fi
done


# echo "/usr/bin/xrandr --fb ${VWIDTH}x${VHEIGHT} $SLIST 2>/dev/null"
/usr/bin/xrandr --fb ${VWIDTH}x${VHEIGHT} $SLIST 2>/dev/null


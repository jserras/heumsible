#!/bin/bash

width=`gm identify $1 -format "%w"`
heigth=`gm identify $1 -format "%h"`

#if [[ $width -gt 1440 ]]; then
#  echo "make smaller (width at least)";
  gm convert $1 -background black -geometry 1920x1080 ~/.i3/lock.png
#elif [[ $heigth -gt 900 ]]; then
#  echo "make smaller (heigth only)";
#  gm convert $1 -background black -geometry 1440x900 -gravity center ~/.i3/lock.png
#else 
#  echo "expanding image";
#  gm convert $1 -background black -extent 1440x900 ~/.i3/lock.png
#fi


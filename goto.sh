#!/bin/bash

if [ "$1" = "-s" ]
then
  echo "Bookmark Name: "
  read bm
  printf "$bm : $(pwd)" >> ~/GoTo/goto.conf
  echo "Save"
elif [ "$1" = "-g" ]
then
  echo "Where to go? "
  read bm
  loc=$(grep -w "$bm" ~/GoTo/goto.conf | cut -d ':' -f 2)
  cd $loc
fi

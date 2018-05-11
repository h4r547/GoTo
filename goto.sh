#!/bin/bash

if [ "$1" = "-s" ]
then
  echo "Bookmark Name: "
  read bm
  if [ $(grep -c "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    printf "$bm : $(pwd)" >> ~/GoTo/goto.conf
    echo "Save"
  else
    echo "Bookmark Already Exists"
  fi
elif [ "$1" = "-g" ]
then
  echo "Where to go? "
  read bm
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    echo "Bookmark doesn't exist"
  else
    loc=$(grep -i "$bm " ~/GoTo/goto.conf | cut -d ':' -f 2)
    if [ -d $loc ]
    then
      cd $loc
    else
      echo "The directory does not exist."
      grep -v "$loc" ~/GoTo/goto.conf > temp.txt
      mv temp.txt ~/GoTo/goto.conf
      echo "The entry has been deleted."
    fi
  fi
else
  echo "Invalid Option. Use '-s' to save this location. Use '-g' to goto a location"
fi

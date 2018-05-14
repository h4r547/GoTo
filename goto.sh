#!/bin/bash
if [ "$1" = "-s" ]
then
  echo "Enter Bookmark Name: "
  read bm
  mkdir -p ~/GoTo
  (cd ~/GoTo && touch goto.conf)
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    echo "$bm : $(pwd)" >> ~/GoTo/goto.conf
    echo "Saved"
  else
    echo "Bookmark Already Exists. Use -e to edit existing bookrmark."
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
elif [ "$1" = "-l" ]
then
  cat ~/GoTo/goto.conf
  echo
elif [ "$1" = "-r" ]
then
  echo "Enter Bookmark name"
  read bm
  grep -v -i "$bm" ~/GoTo/goto.conf > temp.txt
  mv temp.txt ~/GoTo/goto.conf
elif [ "$1" = "-h" ]
then
  echo "The sctipt allow you to store file system bookmarks, for easier navigation"
  echo "use -s to save current location as a bookmark."
  echo "use -g to goto a bookmarked location."
  echo "use -l to list all currently saved bookmarks."
  echo "use -r to delete a currently saved bookmark."
  echo "use -e to edit a currently saved bookmark"
elif [ "$1" = "-e" ]
then
  mkdir -p ~/GoTo
  (cd ~/GoTo && touch goto.conf)
  echo "Enter Bookmark Name: "
  read bm
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    echo "Bookmark does not exist. Use -s to save a bookmark."
  else
    grep -v -i "$bm" ~/GoTo/goto.conf > temp.txt
    mv temp.txt ~/GoTo/goto.conf
    echo "Enter new bookmark name."
    read bm
    echo "$bm : $(pwd)" >> ~/GoTo/goto.conf
    echo "Edit Complete."
  fi
else
  echo "Invalid Option. Use -h to get help."
fi

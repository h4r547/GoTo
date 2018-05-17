#!/bin/bash
if [ "$1" = "-s" ] #if the user wants to save the current working directory.
then
  echo "Enter Bookmark Name: "
  read bm #read the user input
  mkdir -p ~/GoTo #create the required directory if it does not already exist
  (cd ~/GoTo && touch goto.conf) #navigate to that directory and create the config file, if it doesn't exist already.
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ] # checking if the bookmark name the user is trying to save exists already.
  then
    echo "$bm : $(pwd)" >> ~/GoTo/goto.conf #append the bookmark name and current working directory to the end of the config file.
    echo "Saved"
  else
    echo "Bookmark Already Exists. Use -e to edit existing bookrmark."
  fi
elif [ "$1" = "-g" ] #if the user wants to navigate to a save location.
then
  echo "Where to go? "
  read bm
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    echo "Bookmark doesn't exist"
  else
    loc=$(grep -i "$bm " ~/GoTo/goto.conf | cut -d ':' -f 2) #fetch the just the directory location from config file associated with the entered bookmark name.
    if [ -d $loc ] #if the directory exists navigate to that directory.
    then
      cd $loc
    else #other wise it is a rogue entry. So delete it.
      echo "The directory does not exist."
      grep -v "$loc" ~/GoTo/goto.conf > temp.txt #deleting the rogue entry and saving the results in a temporary file.
      mv temp.txt ~/GoTo/goto.conf #overwritting the config file with the updated entries.
      echo "The entry has been deleted."
    fi
  fi
elif [ "$1" = "-l" ] #if the user wants to view the available bookmarks.
then
  cat ~/GoTo/goto.conf
  echo
elif [ "$1" = "-r" ] #if the user wants to delete a saved bookmark.
then
  echo "Enter Bookmark name"
  read bm
  grep -v -i "$bm " ~/GoTo/goto.conf > temp.txt #deleting the entry and saving the results in a temporary file.
  mv temp.txt ~/GoTo/goto.conf #overwritting the config file with the updated entries.
elif [ "$1" = "-h" ]  #if the user wants help on how to use the script.
then
  echo "The sctipt allow you to store file system bookmarks, for easier navigation"
  echo "use -s to save current location as a bookmark."
  echo "use -g to goto a bookmarked location."
  echo "use -l to list all currently saved bookmarks."
  echo "use -r to delete a currently saved bookmark."
  echo "use -e to edit a currently saved bookmark."
elif [ "$1" = "-e" ] #if the user wants to edit a saved entry.
then
  mkdir -p ~/GoTo
  (cd ~/GoTo && touch goto.conf)
  echo "Enter Bookmark Name: "
  read bm
  if [ $(grep -c -i "$bm " ~/GoTo/goto.conf)  = 0 ]
  then
    echo "Bookmark does not exist. Use -s to save a bookmark."
  else
    loc=$(grep -i "$bm " ~/GoTo/goto.conf | cut -d ':' -f 2) #loc holds the directory location for entered bookmark name.
    grep -v -i "$bm " ~/GoTo/goto.conf > temp.txt #deleting the entry associated with the entered bookmark name and save it in a temporary file,
    mv temp.txt ~/GoTo/goto.conf #overwritting the config file with the updated data.
    echo "Enter new bookmark name."
    read newbm #read the new bookmark name.
    echo "$newbm : $loc" >> ~/GoTo/goto.conf #save the new entry in the config file.
    echo "Edit Complete."
  fi
else #if the user enters an Invalid option.
  echo "Invalid Option. Use -h to get help."
fi

#!/bin/bash

if [ "$1" = "-s" ]
then
  printf "$2 : $(pwd)" >> goto.conf
  echo "Save"
elif [ "$1" = "-g" ]
then
  loc=$(grep -w "$2" ~/GoTo/goto.conf | cut -d ':' -f 2)
fi

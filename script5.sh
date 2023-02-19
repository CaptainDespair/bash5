#!/bin/bash

echo -n "What is your name? "
read -r name
echo "Hello, $name! "

echo -n "Enter the full path to search for files in the form */dir/: "
read -r path

echo -n "Enter a template to search for files: " 
read -r pattern

while :
do
  echo "Found files: "
  ls $path$pattern
  echo "Enter the command number: 
  1) remove files from dir 
  2) copy files to a /target/
  3) rename files
  *for exit press <CTRL+C>
  "
  read -r answer

  if [[ $answer -eq 1 ]]
    then
      rm -i $path$pattern
      echo "removing files..."
    echo "Done!"
  elif [[ $answer -eq 2 ]]
    then
      cp -a $path$pattern /home/captaindespair/target
      echo "copy your files to a /target/ ..."
    echo "Done!"
  elif [[ $answer -eq 3 ]]
    then
      cd $path
      echo "rename your files..."
      echo "which part to rename?"
      read -r oldpart
      echo "how to rename part?"
      read -r newpart
      for file in * *; do
        mv -i "$file" "${file//$oldpart/$newpart}"
      done
      echo "Done!" 
  else
    echo "Failed input!"
  fi
done
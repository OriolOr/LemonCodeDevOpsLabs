#!/bin/bash

#create file structure
mkdir -p foo/{dummy,empty}
cd foo/dummy
touch file{1..2}.txt

if [ $# -gt 0 ]; then
    echo "$1" > file1.txt
else
    echo "Que me gusta la bash!!!!" > file1.txt
fi

#copy file1 content to file2
cat file1.txt>>file2.txt

#move to empty folder
mv file2.txt ../empty


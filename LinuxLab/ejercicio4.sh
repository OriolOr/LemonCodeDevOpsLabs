#!/bin/bash

#search in url 
curl $1 -o webFile.txt
var=$(curl $1 | grep -io $2 | wc -l);
echo "$var"
echo "La palabra $2 aprarece $var veces"
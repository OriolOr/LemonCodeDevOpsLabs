#!/bin/bash

#search in url 
if [ $# == 2 ]; then
    curl -s $1 -o webFile.txt
    nWords=$(curl -s $1 | grep -io $2 | wc -w);
    nLine=23
    if [$nWords == 0]; then
        echo "No se ha encontrado la palabra $1"
    else 
        echo "La palabra $2 aprarece $nWords veces"
        echo "Aparece por primera vez en la línea $nLine"
    fi
else
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
fi

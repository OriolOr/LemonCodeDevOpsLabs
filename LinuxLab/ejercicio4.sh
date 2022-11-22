#!/bin/bash

#search in url 
if [ $# -eq 2 ]; then
    #get web info
    curl -s $1 -o webFile.txt
    
    #file parse
    nWords=$(curl -s $1 | grep -io $2 | wc -w);
    nLine=$(grep -w $2 -n webFile.txt| head -1| cut -d : -f 1);

    if [ $nWords -eq 1 ]; then
        echo "La palabra $2 aparece 1 vez"
        echo "Aparece únicamente en la linea $nLine"
    elif [ $nWords -gt 1 ]; then
        echo "La palabra $2 aprarece $nWords veces"
        echo "Aparece por primera vez en la línea $nLine"
    else 
        echo "No se ha encontrado la palabra $2"
    fi
else
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
fi


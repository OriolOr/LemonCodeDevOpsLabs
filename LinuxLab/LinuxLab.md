practica linux 

Ejercicio 1 : 

Para crear el directorio con sus correspondinetes subdirectorios y archivos, utilizamos el siguiente comando :

```
> mkdir -p foo/{dummy,empty}
```

para crear el archivo se utliliza el comando touch del siguiente modo, entrando dentro del directorio dummy con "cd foo/dummy": 

```
> touch file{1..2}.txt
```

y añadimos el contenido en file2.txt con el siguiente comando

```
> echo "Me encanta la bash!!"> file2.txt 
```

Ejercicio 2 : 

Para volcar el contenido del archivo 1 al 2 realizamos el siguiente comando: 
 ```
 > cat file1.txt>>file2.txt
 ```
 Y con el siguiente comando se mueve al directorio empty: 

 ```
 > mv file2.txt empty
 ```


 

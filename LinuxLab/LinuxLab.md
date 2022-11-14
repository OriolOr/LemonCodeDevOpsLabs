practica linux 

Ejercicio 1 : 

Para crear el directorio con sus correspondinetes subdirectorios y archivos, utilizamos el siguiente comando :

```
> mkdir -p foo/{dummy,empty}
```

Para crear el archivo se utliliza el comando `touch` del siguiente modo, entrando al directorio donde queremos crear estos dos archivos mediante `cd`: 

```
> cd foo dummy
> touch file{1..2}.txt
```

y añadimos el contenido en `file1.txt` con el siguiente comando:

```
> echo "Me encanta la bash!!"> file1.txt 
```

Ejercicio 2 : 

Para volcar el contenido del archivo 1 al 2 utilizamos el comando `cat` del siguiente modo: 
 ```
 > cat file1.txt>>file2.txt
 ```
 Y con el siguiente comando se mueve al directorio empty: ToDo

 ```
 > mv file2.txt ../empty
 ```


 

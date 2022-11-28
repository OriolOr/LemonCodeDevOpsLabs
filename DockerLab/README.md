
#Laboratorio Docker

En primer lugar deberemos crear los archivos ´DockerFile´ tanto en el directorio de frontend como en el de backend. Este ´Dockerfile´ contiene los pasos para construir nuestra imagen de docker que posteriormente sera utilizada dentro del ´docker-compose´ para crear nuestros contenedores.

Una vez tenemos el  archivo de docker-compose creado, para desplegar este deberemos movernos al directorio raiz y ejecutar el siguiente comando : 

```
 docker-compose -f "ejercicio2-deploy.yaml" up -d 
```



una vez desplegado comprobamos que todos los contenedores estan activos desde la applicacion de docker destop: 

![image info](/pics-md/ejercicio2-0.png)

Para comprobar que todos los contenedores de la red estan bien comunicados añadimos desde un cliente de mongo un seguido de documentos dentro de la coleccion Topics del siguiente modo : 

![image info](/pics-md/ejercicio2-1.png)

Desde el navegador accediendo a `http://localhost:8080` se deberia ver toda la informacion que hemos añadido en la base de datos: 

![image info](/pics-md/ejercicio2-2.png)

Gracias al volumen que hemos creado para el contenedor `some-mongo`podemos persistir los datos que contiene la coleccion Topics aunque los contenedores se paren.

Una vez esta todo desplegado, si queremos parar algun contenedor utilizamos el siguiente comando :
```
docker stop {container-id}
```
obtenemos el container-id mediane 'docker-ps' obteniendo el siguiente output por consola : 
![image info](/pics-md/ejercicio2-3.png)

si queremos parar todos los contenedores utilizaremos el siguiente comando. 
```
docker stop
```

Por último si queremos eliminar los contenedores realizamos el siguiente comando, en este caso si quieremos eliminar el contendor del frontend: 

```
docker rm frontend
```
o por el contrario si queremos eliminar todos los contenedores: 
```
docker rm {ps -a -q}
```


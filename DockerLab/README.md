Una vez tenemos el  archivo de docker-compose creado, para desplegar este deberemos movernos al directorio raiz y ejecutar el siguiente comando : 

´´´
 docker-compose -f "ejercicio2-deploy.yaml" up -d 
´´´

una vez desplegado comprobamos que todos los contenedores estan activos desde la applicacion de doccker destop: 


y desde el navegador accediendo a `http://localhost:8080`


Una vez esta todo desplegado si queremos parar algun contenedor utilizamos el siguiente comando 

´´´
docker stop {container-id}
´´´
obtenemos el container-id mediane 'docker-ps' obteniendo el siguiente output por consola : 


si queremos parar todos los contenedores utilizaremos el siguiente comando. 
´´´
docker stop
´´´

Por último si queremos eliminar los contenedores realizamos el siguiente comando, en este caso si quieremos eliminar el contendor del frontend: 

´´´
docker rm frontend
´´
o
´´´
docker rm {ps -a -q}
´´´

si queremos eliminaro tods los contenedores.

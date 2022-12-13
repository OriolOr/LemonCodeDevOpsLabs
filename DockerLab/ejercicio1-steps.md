# Laboratorio Docker Ejercicio 1

En primer lugar debemos construir tanto las imagernes de frontend como la de backend. Estas estan dentro de cada directorio tanto de frontend como de backend

Una vez estan creados estos archivos, creamos la red `lemoncode-challenge` con el siguiente comando: 

```
docker network create lemoncode-challenge
```

Creamos también el volumen para la base de datos: 
```
docker volume create dbdata
```
<>
Para crear el contenedor de mongo llamado some-mongo, indicandole el puerto por el que queremos acceder al contenedor su nombre, la red (loemoncode-challenge) y indicamos también el volumen dondde va a persistir los datos:
```
docker run -d --name some-mongo -p 27017:27017 --network lemoncode-challenge -v mongodbdata:/dbdata mongo
```

Para el backend, necesitamos que este tenga mapeado el puerto `5000` con el siguiente comando : 
```
docker run -d --name backend -p 5000:5000 --network lenmoncode-challenge {nombre de la imagen de backend}
```

Para el frontend, debemos mapear el puerto `8080` : 

```
docker run -d --name frontend -p 8080:8080 --network lenmoncode-challenge {nombre de la imagen del frontend}
```

FInalmente una vez tenemos todos los containers montados verificamos que toda funciona correctamente,En primer lugar creamos una coleccioón llamada `TopicsDb y añadimos varios registros


Una vez tenemos esto levantado, accedemos a  http://localhost:8080/api/topics y comorobamos que los registros añadidos aparecen en nuestro frontend:
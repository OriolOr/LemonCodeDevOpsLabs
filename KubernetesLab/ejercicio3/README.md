## Ingress

Previamente a construir nuestros archivos de configuración para nuestro cluster de kuberetes debemos generar y publicar las imagenes de docker para el deployment del frontend y de la api, en mi caso estas imagenes son `oriolors/todo-front` y `oriolors/todo-api` respectivamente. 
## Paso 1. Crear todo-front.

Una vez tenemos la imagen de `todo-front` publicada, pasamos a configuurar el deploy de esta imagen en nuestro cluster, del siguiente modo: 

```
codigo del deployment
```

Creamos tambien el servicio para el `todo-front` : 

```
codigo del service
```

Finalmente comprovamos que el deploy se ha desplegado correctamente, 

(imagen del deploy ok y si es necesario adjuntqar captura del deploy activo despues de hacer un tunner de minikube o hacer un wget)

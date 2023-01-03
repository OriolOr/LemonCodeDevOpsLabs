# Kubernetes Lab 

### Ejercicio 1. Monolito en memoria.

Para este primer ejercicio, debemos pushear la imagen de docker de nuestro proyecto a dockerhub, con tal de que nuestros contenedores puedan hacer pull de esta imagen:

![image info](pics-md/ejercicio1-0.png)

## Paso 1. Crear todo-app

Una vez nuestra imagen de docker esta publicada en el hub de docker, procedemos a crear el archivo de deployment de nuestros pods. Ademas podemos guardar las variables de entorno en un 'configmap'


--port fortwarding 

-- snapshop browser

 ## Paso 2. Acceder a todo-app desde fuera del clúster

 Una vez tenemos nuestro deployment funcionand, necesitamos que este sea accesible desde fuera del cluster , y para ello creamos un service de tipo load balancer del siguiente modo: 

 

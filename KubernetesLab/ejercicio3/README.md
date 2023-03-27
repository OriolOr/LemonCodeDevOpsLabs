## Ingress

Previamente a construir nuestros archivos de configuración para nuestro cluster de kuberetes debemos generar y publicar las imagenes de docker para el deployment del frontend y de la api, en mi caso estas imagenes son `oriolors/todo-front` y `oriolors/todo-api` respectivamente. 
## Paso 1. Crear todo-front.

Una vez tenemos la imagen de `todo-front` publicada, pasamos a configuurar el deploy de esta imagen en nuestro cluster, del siguiente modo: 

```
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: todo-front
    spec:
    selector:
        matchLabels:
        app: todo-front
    template:
        metadata:
        labels:
            app: todo-front
        spec:
        containers:
        - name: todo-front
            image: oriolors/todo-front:latest
            resources:
            limits:
                memory: "128Mi"
                cpu: "500m"
            ports:
            - containerPort: 80
```

Comprovamos que nuestro deploy esta corriendo correctamente y no hay 

Creamos tambien el servicio para el `todo-front` : 

```
    apiVersion: v1
    kind: Service
    metadata:
    name: todo-front-service
    spec:
    selector:
        app: todo-front
    ports:
    - port: 80
        targetPort: 80
```

## Paso 2. Crear todo-api.

Realizamos lo mismo que en el paso 1 para la imagen de `todo-api` 

Creamos el `deploy.yaml`.

```
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: todo-api
    spec:
    selector:
        matchLabels:
        app: todo-api
    template:
        metadata:
        labels:
            app: todo-api
        spec:
        containers:
        - name: todo-api
            image: oriolors/todo-api:latest
            resources:
            limits:
                memory: "128Mi"
                cpu: "500m"
            ports:
            - containerPort: 3000
```

Y el `service.yaml`. 

```
    apiVersion: v1
    kind: Service
    metadata:
    name: todo-api-service
    spec:
    selector:
        app: todo-api
    ports:
    - port: 3000
        targetPort: 3000
```


Comprovamos que tanto el deploy del front como de la api estan correiendo correctamente: 

```
orusordo@orusordo-VM:~/KubernetesLab/Ejercicio3$ k get pods
NAME                          READY   STATUS    RESTARTS   AGE
todo-api-789b75f68f-8bbcg     1/1     Running   0          49s
todo-front-5df59bfcc9-fm25d   1/1     Running   0          50s

orusordo@orusordo-VM:~/KubernetesLab/Ejercicio3$ k get deploy
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
todo-api     1/1     1            1           55s
todo-front   1/1     1            1           55s

```
## Paso 3. Ingress

Ahora que ya tenemos ambos nodos corriendo pasamos a incorporar ingress a nuestro setup.

instalamos el addon de ingress mediante el comando `minikube addons enable ingress`. Una vez instalado creamos el archivo de configuracion de ingress tal que asi : 


```

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: todo-ingress
  labels:
    name: todo-ingress
spec:
  rules:
  - host: ingress.local
    http:
      paths:
      - pathType: Prefix
        path: "/api"
        backend:
          service:
            name: todo-api-service 
            port: 
              number: 3000
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: todo-front-service 
            port: 
              number: 80


```

Finalmente comprovamos que nuestro host tiene asignado una ip y esta es accesible desde fuera del cluster : 

```
roche@roche-VM:~/KubernetesLab/Ejercicio3$ k get ingress
NAME           CLASS   HOSTS           ADDRESS        PORTS   AGE
todo-ingress   nginx   ingress.local   192.168.49.2   80      9d

```

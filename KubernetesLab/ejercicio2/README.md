# Kubernetes Lab 

### Ejercicio 2. Monolito.

Para este segundo ejercicio, construimos nuestra imagen de docker del mismo modo que hemos hecho e la imagen 1 , en este caso la imagen se llamará `oriolors/todoapp-pg`

 ## Paso 1. Crear una capa de persistencia de datos

 En primer lugar creamos un `StorageClass` que contanedra la informacion del aprovisionamineto dinámico de los recursos de persistencia: 

 ```

    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
    name: sc
    provisioner: k8s.io/minikube-hostpath
    reclaimPolicy: Delete
    volumeBindingMode: Immediate

 ```

 ```

    apiVersion: v1
    kind: PersistentVolume
    metadata:
    name: pvtodoapp-pg
    spec:
    storageClassName: sc
    accessModes:
        - ReadWriteOnce
    capacity:
        storage: 1Gi
    hostPath:
        path: /data/pvtodoapp-pgs/

 ```

 Una vez todos los archivos han sido creados, los aplicamos 
 
 ```
 k apply -f . 
 ```
 y comprovamos que todos los elementos se han generado correctamente  : 

 
  ## Paso 2. Crear todo-app

  Una vez esta configurada la base de datos , realizamos de un modod parecido al ejericio 1 un el `deploy.yaml` , en este utilizamos la imagen creada inicialmente 

  ```

    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: todo-app-pg
    spec:
    selector:
        matchLabels:
        app: todo-app-pg
    template:
        metadata:
        labels:
            app: todo-app-pg
        spec:
        containers:
        - name: todo-app-pg
            image: oriolors/todoapp-pg
            resources:
            limits:
                memory: "128Mi"
                cpu: "500m"
            ports:
            - containerPort: 3000

  ```


  ## Paso 3. Acceder a todo-app desde fuera del clúster
 Para acceder desde fuera del cluster necesitamos crear servicio de tipo `load balancer`, del siguiente modo: 

 ```

    apiVersion: v1
    kind: Service
    metadata:
    name: todoapp-loadbalancer
    spec:
    selector:
        app: todo-app-pg
    ports:
    - port: 3000
        targetPort: 3000
    type: LoadBalancer

 ```

 una vez creado, aplicamos este archivo. abrimos un nuevo terminal y aplicamos el comando `minikube tunel`

 una vez aplicado volvemos al terminal anterior y volvemos a cargar la lista de servicios mediante la instruccion `kubectl get svc` donde ya podemos ver la ip que se ha asignado a nuestro servicio. 

 Copiamos la ip en el navegador y vemos como la aplicaion se ha desploegado correctamente y contiene todos los campos almacenados en la base de datos. 
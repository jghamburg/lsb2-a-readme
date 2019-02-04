# How to Startup the application  

## Startup using docker compose  

To startup all components run this commands from the checkout directory.  
First startup the basic infrastructure (mongodb and rabbitmq).  

```
docker-compose -f lsb2-a-readme/platform/dcc-infrastruct.yml up -d
```

Next startup the spring cloud config server.  

```
docker-compose -f lsb2-config-server/docker/env/local.yml up -d
curl http://localhost:8888/actuator/health
```

After successful startup you can run the other services:  

```
find lsb2-* -name local.yml -exec docker-compose -f {} up -d \;
```

To stop all components just run:  
```
find ./lsb2-* -name 'local.yml' -exec docker-compose -f {} stop \;  
```

## Startup on kubernetes  

If you have provided a stable infrastructure using docker-compose and now want to experiment with kubernetes  
-- Just do it!  
If you are using docker for desktop (Mac and Windows) and you are using the experimental support for kubernetes   
you can deploy your apps using `docker stack`command.  

```
docker stack deploy  --compose-file lsb2-config-server/docker/env/local.yml --namespace local --orchestrator kubernetes config-server
docker stack deploy  --compose-file lsb2-eureka-server/docker/env/local.yml --orchestrator kubernetes eureka-server
docker stack deploy  --compose-file lsb2-hystrix-dashboard/docker/env/local.yml --orchestrator kubernetes hystrix-server
docker stack deploy  --compose-file lsb2-images/docker/env/local.yml --orchestrator kubernetes image-server
docker stack deploy  --compose-file lsb2-chat/docker/env/local.yml --orchestrator kubernetes chat-server
docker stack deploy  --compose-file lsb2-comments/docker/env/local.yml --orchestrator kubernetes comments-server
kubectl get pod
kubectl get deployment
```

Don't forget to install and use the kubernetes dashboard:  

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml  
```

and startup the local proxy in a separate terminal window  

```
kubectl proxy 
```

Now you should be able to see and access your instances.

# Learning Springboot 2  

The repos starting with prefix *lsb2-* are strongly based on the work of 
Greg L. Turnquist and his book [Learning Spring Boot 2.0 - Second Edition, Nov 2017](https://www.packtpub.com/application-development/learning-spring-boot-20-second-edition).  

The complete code to the book can be found on [github maintained by the author](https://github.com/learning-spring-boot/learning-spring-boot-2nd-edition-code).

## Intro  

Why setting up an extra set of repositories and not just using the repo of the author?  

The basic idea was to start out learning spring boot 2.0. But very early on I realized 
a lot of specialties used by my team to 

* setup a local development environment  
* provide different deployment stages  
* use different orchestration toos  

To support all of this I jumped right into the first code which sounded like the way I wnated 
it to be on an architectural point of view. So the code in these repositories is based on the results of chapter 9.  

The first addition after upgrading to spring-boot 2.0.4.RELASE was to containerize with __docker__ and startup the environment via __docker-compose__.  

## Startup all components under docker  

If you like to get a first impression on the application you have to follow these steps

Checkout all repos starting with lsb2-* to a local directory

```
git clone https://github.com/jghamburg/lsb2-chat.git  
git clone https://github.com/jghamburg/lsb2-comments.git  
git clone https://github.com/jghamburg/lsb2-images.git  
git clone https://github.com/jghamburg/lsb2-config-server.git  
git clone https://github.com/jghamburg/lsb2-config-data.git  
git clone https://github.com/jghamburg/lsb2-eureka-server.git  
git clone https://github.com/jghamburg/lsb2-hystrix-dashboard.git  
```
To startup all components run this commands from the checkout directory.  
First startup the config server and basic infrastructure (mongodb and rabbitmq).  

```
docker-compose -f lsb2-config-server/docker/env/local.yml up -d
curl http://localhost:8888/actuator/health
```

After startup you can setup the other services:  

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


## References
  
[Docker-Compose and Kubernetes](https://blog.docker.com/2018/05/kubecon-docker-compose-and-kubernetes-with-docker-for-desktop/)  
[Kubernetes dashboard](https://github.com/kubernetes/dashboard)  

## Open Issues  
What I like to implement next.  

### Using docker-compose plugin for gradle  
See details in project amplience-proxy.

### Deploying under kubernetes with helm  
See details in project amplience-proxy and asset-management. These projects are using mongo db and rabbitmq.  

### Using Jaeger as OpenTracing Server  
Use the Jaeger infrastructure to support opentracing standards.  

* [Compact summary on open tracing from sematext](https://sematext.com/wp-content/uploads/2018/04/opentracing-emerging-distributed-tracing-standard.pdf)  
* [OpenTracing API Contributions - Github](https://github.com/opentracing-contrib)  
* [Java Spring Cloud library -> Finchley release](https://github.com/opentracing-contrib/java-spring-cloud)  

### Use spring-cloud-kubernetes  
This plugin supports use of discovery service client, which is referencing the kubernetes internal service registry for details.  
The config service can be configured to use comfigMaps and secrets.  
[spring-cloud-kubernetes](https://github.com/spring-cloud/spring-cloud-kubernetes)

### Mongodb with replicaset  
For using mongodb in a production environment it is mandatory that the database server is
setup properly.

* secure connections  
* encrypted data  
* multiple replicasets for failover scenarios  

## References used  

A list of references used to improve and extend the project:  

### Docker  

Improve Docker management like creation of images.  
* [Best practice for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#general-guidelines-and-recommendations)
* [apk best practices](https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md)



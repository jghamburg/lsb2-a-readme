# Open Issues  
What I like to implement next.  

## Using docker-compose plugin for gradle  
See details in project amplience-proxy.

## Deploying under kubernetes with helm  
See details in project amplience-proxy and asset-management. These projects are using mongo db and rabbitmq.  

## Using Jaeger as OpenTracing Server  
Use the Jaeger infrastructure to support opentracing standards.  

* [Compact summary on open tracing from sematext](https://sematext.com/wp-content/uploads/2018/04/opentracing-emerging-distributed-tracing-standard.pdf)  
* [OpenTracing API Contributions - Github](https://github.com/opentracing-contrib)  
* [Java Spring Cloud library -> Finchley release](https://github.com/opentracing-contrib/java-spring-cloud)  

## Use spring-cloud-kubernetes  
This plugin supports use of discovery service client, which is referencing the kubernetes internal service registry for details.  
The config service can be configured to use comfigMaps and secrets.  
[spring-cloud-kubernetes](https://github.com/spring-cloud/spring-cloud-kubernetes)

## Mongodb with replicaset  
For using mongodb in a production environment it is mandatory that the database server is
setup properly.

* secure connections  
* encrypted data  
* multiple replicasets for failover scenarios  



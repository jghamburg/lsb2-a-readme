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
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-chat.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-comments.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-images.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-config-server.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-config-data.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-eureka-server.git  
git clone ssh://git@bitbucket.scm.otto.de/pport/lsb2-hystrix-dashboard.git  
```
To startup all components run this command from the checkout directory

@TODO: add commandline details

To stop all components just run:
```
find ./lsb2-* -name 'local.yml' -exec docker-compose -f {} stop \;  
```

## Open Issues  
What I like to implement next.  

### Using docker-compose plugin for gradle  
See details in project amplience-proxy.

### Deploying under kubernetes with helm  
See details in project amplience-proxy and asset-management. These projects are using mongo db and rabbitmq.  

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


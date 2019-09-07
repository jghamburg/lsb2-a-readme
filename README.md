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
* use different orchestration tools  

To support all of this I jumped right into the first code which sounded like the way I wanted 
it to be on an architectural point of view. So the code in these repositories is based on the results of chapter 9.  

The first addition after upgrading to spring-boot 2.1.2.RELASE was to containerize with __docker__ and startup the environment via __docker-compose__.  

## Starter  

If you like to get a first impression on the application you can follow these steps

Checkout all repos starting with lsb2-* to a local directory

```bash
git clone https://github.com/jghamburg/lsb2-chat.git  
git clone https://github.com/jghamburg/lsb2-comments.git  
git clone https://github.com/jghamburg/lsb2-images.git  
git clone https://github.com/jghamburg/lsb2-config-server.git  
git clone https://github.com/jghamburg/lsb2-config-data.git  
git clone https://github.com/jghamburg/lsb2-eureka-server.git  
git clone https://github.com/jghamburg/lsb2-hystrix-dashboard.git  
```

## The Architecture  

```

																		|--------------------|
																		|       User         |
																		|--------------------|

|---------------------|							|--------------------|
| config-server:8888  |							|     chat:9999      |
|---------------------|             |--------------------|

|---------------------|             |--------------------|             |--------------------|
| eureka-server:8761  |             |   images:8200      |             |   mongodb:27017    |
|---------------------|             |--------------------|             |--------------------|

|---------------------|             |--------------------|             |--------------------|
| hystrix-server:7979 |             |  comments:9000     |             |  rabbitmq:5672     |
|---------------------|             |--------------------|             |--------------------|


```

## Whats next?  

* [How to startup the application](./Startup.md)  
* [Remote Debugging](./RemoteDebugging.md)  
* [References](./References.md)  
* [Open Issues and Ideas for the future](./Issues.md)

## Tools of Interest  

As build tool I use gradle version 5.x.  You find interesting references on setting up build files in the reference section.  
The major interest is to provide a single point of administration for all important tasks within the software lifecycle. This contains especially all tasks on building and deploying of components through the use of gradle.  

## Migration to Java 11  

Because java 8 will reach end of public support soon I started out on migration concepts from java 8 to java 11.  
This migration contains details about java module support also.  



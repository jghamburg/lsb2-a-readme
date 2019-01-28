# Remote Debugging of Springboot apps  

As an example for remote debugging within the ide intellij I use the component lsb2-chat.

## Setting up gradle  

Add to build.gradle  

```groovy
dependencies {
	compile('org.springframework.boot:spring-boot-devtools')
}
```

add to application.yml  

```

```

## Setting up ide IntelliJ  

```
-> Run Configuration -> Application  
Main class: org.springframework.boot.devtools.RemoteSpringApplication
VM options: -Dspring.profiles.active=local
Program arguments: http://localhost:9999
Environment: spring.devtools.remote.secret
```
The spring application environment must be set the same as as ide config.

More details described [here][development environment on spring boot].  

Starting the app inside a container first.  
Then start application inside ide using remote configuration.  
The app will startup like this  
```
  .   ____          _                                              __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _          ___               _      \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` |        | _ \___ _ __  ___| |_ ___ \ \ \ \
 \\/  ___)| |_)| | | | | || (_| []::::::[]   / -_) '  \/ _ \  _/ -_) ) ) ) )
  '  |____| .__|_| |_|_| |_\__, |        |_|_\___|_|_|_\___/\__\___|/ / / /
 =========|_|==============|___/===================================/_/_/_/
 :: Spring Boot Remote ::  (v2.0.4.RELEASE)

The connection to http://localhost:9999 is insecure. You should use a URL starting with 'https://'.
```

## Resources  

[development environment on spring boot]:(https://medium.com/@lhartikk/development-environment-in-spring-boot-with-docker-734ad6c50b34)
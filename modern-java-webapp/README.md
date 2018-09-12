
# Modern Web Application (self-contained executable jar file)

#### Requirements

* Java 8 (JDK)
* Maven
* Docker v17.09.0-ce (2017-09-26) or greater
* Familiarity with [Spring Boot](https://projects.spring.io/spring-boot/) and [Docker](https://docs.docker.com/engine/docker-overview/)    

#### How to Build?

```
mvn clean package
```

#### How to Run? 

```
mvn spring-boot:run
```

or, run within a Docker container:

```
docker run -it --rm --tmpfs /tmp -p 8080:8080 localhost:5000/modern-java-webapp:latest
``` 

### RTFM

* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [Manage data in Docker](https://docs.docker.com/storage/)
* [Dockerfile Maven Plugin](https://github.com/spotify/dockerfile-maven#dockerfile-maven)
* [Spring Boot with Docker](https://spring.io/guides/gs/spring-boot-docker/)
* [Spring Boot Reference Guide](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)

#### YouTube 

* [Getting Started with Spring Boot](https://www.youtube.com/watch?v=sbPSjI4tt10)

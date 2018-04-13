
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

```
docker build ./target -t modern-java-webapp
```

#### How to Run? 

```
mvn spring-boot:run
```

or, run within a Docker container:

```
docker run -it --rm -p 8080:8080 modern-java-webapp
``` 

### RTFM

* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [Spring Boot Reference Guide](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)

#### YouTube 

* [Getting Started with Spring Boot](https://www.youtube.com/watch?v=sbPSjI4tt10)

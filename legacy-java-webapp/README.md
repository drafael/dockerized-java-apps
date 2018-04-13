
# Legacy Web Application (war file)

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
docker build ./target -t legacy-java-webapp
```

#### How to Run? 

```
mvn spring-boot:run
```

or, run within a Docker container:

```
docker run -it --rm -p 8080:8080 legacy-java-webapp
```

### RTFM

* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)

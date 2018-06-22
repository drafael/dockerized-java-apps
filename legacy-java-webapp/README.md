
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

#### How to Run? 

```
mvn spring-boot:run
```

or, run within a Docker container:

```
CATALINA_HOME=/usr/local/tomcat

docker run -it --rm -p 8080:8080 \
  --tmpfs /tmp \
  --tmpfs $CATALINA_HOME/temp   \
  --tmpfs $CATALINA_HOME/work   \
  --tmpfs $CATALINA_HOME/logs   \
  --tmpfs $CATALINA_HOME/conf/Catalina   \
  localhost:5000/legacy-java-webapp:latest
```

### RTFM

* [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
* [Dockerfile Maven Plugin](https://github.com/spotify/dockerfile-maven#dockerfile-maven)
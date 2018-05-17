
# Dockerized Java Applications (demo)

[![Build Status](https://travis-ci.org/drafael/dockerized-java-apps.svg?branch=master)](https://travis-ci.org/drafael/dockerized-java-apps)

#### Requirements

* Java 8 (JDK)
* Maven
* [Docker](https://docs.docker.com/engine/installation/) v17.09.0-ce (2017-09-26) or greater
* [Docker Compose](https://docs.docker.com/compose/install/) v1.15.0 or greater
* Familiarity with [Spring Boot](https://projects.spring.io/spring-boot/), [Docker](https://docs.docker.com/engine/docker-overview/), and [Docker Compose](https://docs.docker.com/compose/overview/)    

#### How to Build

```
mvn clean package
```

#### How to Run 

```
docker-compose up --build
```

#### RTFM

* [Compose file reference](https://docs.docker.com/compose/compose-file/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Use Compose in production](https://docs.docker.com/compose/production/)
* [Docker for Java Developers](https://github.com/docker/labs/tree/master/developer-tools/java/)
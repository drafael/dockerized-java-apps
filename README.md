
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
mvn package
```

#### How to Run 

```
docker-compose up -d
```

#### How to Skip Building Docker Images?

Use `-Ddockerfile.skip` flag:

```
mvn package -Ddockerfile.skip
```

#### How to Build and Push to the Registry?

```
mvn deploy
```

#### Useful Commands

Removing images according to a pattern:

```bash
docker images -a | grep "java-webapp" | awk '{print $3}' | xargs docker rmi -f
```
Remove all images:

```bash
docker rmi $(docker images -a -q)
```

Remove all containers

```bash
docker rm $(docker ps -a -q)
```

### See Also


#### See Also

* [Compose file reference](https://docs.docker.com/compose/compose-file/)
* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Manage data in Docker](https://docs.docker.com/storage/)
* [Use Compose in production](https://docs.docker.com/compose/production/)

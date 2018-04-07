FROM openjdk:8-jre-alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>"
LABEL version="${project.version}"
LABEL description="${project.description}"

ARG HOST_UID
ARG HOST_GID

ENV NOBODY_UID ${HOST_UID:-65534}
ENV NOBODY_GID ${HOST_GID:-65534}

RUN set -ex; \
  apk add 'su-exec>=0.2' --no-cache; \
  apk add shadow --no-cache; \
  groupmod nobody --gid $NOBODY_GID; \
  usermod nobody --uid $NOBODY_UID --gid $NOBODY_GID; \
  apk del shadow; \
  su-exec nobody true; echo "OK"

COPY ${project.artifactId}.jar /
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -ex; \
  chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080

CMD ["java", "-jar", "${project.artifactId}.jar"]
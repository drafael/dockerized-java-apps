FROM openjdk:8-jre-alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>"
LABEL name="${project.name}" version="${project.version}"
LABEL description="${project.description}"
LABEL git.branch="${git.branch}" git.build.time="${git.build.time}" \
  git.commit.id.abbrev="${git.commit.id.abbrev}" \
  git.commit.message.short="${git.commit.message.short}"

ARG HOST_UID
ARG HOST_GID

ENV NOBODY_UID ${HOST_UID:-65534}
ENV NOBODY_GID ${HOST_GID:-65534}

RUN set -ex; \
# install JavaMelody monitoring dependencies
  apk add --no-cache fontconfig ttf-dejavu; \
# grab su-exec for easy step-down from root  
  apk add 'su-exec>=0.2' --no-cache; \
  apk add shadow --no-cache; \
  groupmod nobody --gid $NOBODY_GID; \
  usermod nobody --uid $NOBODY_UID --gid $NOBODY_GID; \
  apk del shadow; \
# verify that the su-exec works
  su-exec nobody true; echo "OK"

COPY ${project.build.finalName}.jar /
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -ex; \
  chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /

VOLUME /tmp

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080

CMD ["java","-Djava.security.egd=file:/dev/./urandom", "-jar", "${project.build.finalName}.jar"]

FROM openjdk:8-jre-alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>" \
      version="@project.version@" \
      git.branch="@git.branch@" \
      git.build.time="@git.build.time@" \
      git.commit.id="@git.commit.id@"

ARG HOST_UID=1000
ARG HOST_GID=1000
ARG JAR_FILE

ENV \
  APP_UID=${HOST_UID} \
  APP_GID=${HOST_GID} \
  APP_DIR=/app  \
  USER_NAME=appuser \
  SPRING_PROFILES_ACTIVE="docker" \
  SERVER_PORT=8080 \
  JAR_FILE=${JAR_FILE:-@project.build.finalName@.jar} \
  JAVA_OPTS="${JAVA_OPTS} -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.security.egd=file:/dev/urandom"

RUN set -ex; \
  mkdir -p ${APP_DIR}; \
# install JavaMelody monitoring dependencies
  apk add --no-cache fontconfig ttf-dejavu; \
# grab su-exec for easy step-down from root
  apk add --no-cache 'su-exec>=0.2'; \
# add tomcat user and group
  addgroup ${USER_NAME} -g ${APP_GID} -S; \
  adduser ${USER_NAME} -u ${APP_UID} -G ${USER_NAME} -g ${USER_NAME} -H -h ${APP_DIR} -s /sbin/nologin -S; \
# verify that the su-exec works
  su-exec ${USER_NAME} true; echo "OK"

COPY ${JAR_FILE} ${APP_DIR}
COPY docker-entrypoint.sh /usr/bin

RUN set -ex; \
  find ${APP_DIR} -type d -exec chmod 755 {} \;; \
  find ${APP_DIR} -type f -exec chmod 644 {} \;; \
  chown -R ${APP_UID}:${APP_GID} ${APP_DIR}    ; \
  chmod +x /usr/bin/docker-entrypoint.sh

WORKDIR ${APP_DIR}

USER ${USER_NAME}

VOLUME /tmp

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE ${SERVER_PORT}

CMD java ${JAVA_OPTS} -jar ${JAR_FILE}

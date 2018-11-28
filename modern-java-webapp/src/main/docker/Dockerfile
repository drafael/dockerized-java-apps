FROM openjdk:8-jre-alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>"
LABEL name="${project.name}" version="${project.version}"
LABEL description="${project.description}"
LABEL git.branch="${git.branch}" git.build.time="${git.build.time}" git.commit.id="${git.commit.id}"

ARG HOST_UID
ARG HOST_GID

ENV APP_UID ${HOST_UID:-1000}
ENV APP_GID ${HOST_GID:-1000}

ENV APP_DIR /app
ENV PATH $APP_DIR/bin:$PATH
ENV USER_NAME appuser

RUN set -ex; \
  mkdir -p $APP_DIR/bin; \
# install JavaMelody monitoring dependencies
  apk add --no-cache fontconfig ttf-dejavu; \
# grab su-exec for easy step-down from root
  apk add --no-cache 'su-exec>=0.2'; \
# add tomcat user and group
  addgroup $USER_NAME -g $APP_GID -S; \
  adduser $USER_NAME -u $APP_UID -G $USER_NAME -g $USER_NAME -H -h $APP_DIR -s /sbin/nologin -S; \
# verify that the su-exec works
  su-exec $USER_NAME true; echo "OK"

COPY ${project.build.finalName}.jar $APP_DIR
COPY docker-entrypoint.sh $APP_DIR/bin

RUN set -ex; \
  find $APP_DIR -type d -exec chmod 755 {} \;; \
  find $APP_DIR -type f -exec chmod 644 {} \;; \
  chown -R $APP_UID:$APP_GID $APP_DIR        ; \
  chmod +x $APP_DIR/bin/docker-entrypoint.sh

WORKDIR $APP_DIR

#USER $USER_NAME

VOLUME /tmp

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080

CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom", "-jar", "${project.build.finalName}.jar"]

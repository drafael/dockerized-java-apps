FROM tomcat:8.5-jre8-alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>"
LABEL name="${project.name}" version="${project.version}"
LABEL description="${project.description}"
LABEL git.branch="${git.branch}" git.build.time="${git.build.time}" git.commit.id="${git.commit.id}"

ARG HOST_UID
ARG HOST_GID

ENV TOMCAT_UID ${HOST_UID:-8080}
ENV TOMCAT_GID ${HOST_GID:-8080}

RUN set -ex; \
# install JavaMelody monitoring dependencies
  apk add --no-cache fontconfig ttf-dejavu; \
# grab su-exec for easy step-down from root
  apk add --no-cache 'su-exec>=0.2'; \
# add tomcat user and group
  addgroup tomcat -g $TOMCAT_GID -S; \
  adduser tomcat -u $TOMCAT_UID -G tomcat -g tomcat -H -h $CATALINA_HOME -s /sbin/nologin -S; \
# verify that the su-exec works
  su-exec tomcat true; echo "OK"

RUN set -ex; \
  rm -rf $CATALINA_HOME/conf; \
  rm -rf $CATALINA_HOME/webapps/examples; \
  rm -rf $CATALINA_HOME/webapps/docs; \
  rm -rf $CATALINA_HOME/webapps/ROOT

COPY conf $CATALINA_HOME/conf
COPY ${project.build.finalName} $CATALINA_HOME/webapps/ROOT
COPY docker-entrypoint.sh $CATALINA_HOME/bin

RUN set -ex; \
  chmod +x $CATALINA_HOME/bin/docker-entrypoint.sh; \
  chown -R $TOMCAT_UID:$TOMCAT_GID $CATALINA_HOME

WORKDIR $CATALINA_HOME

ENTRYPOINT ["docker-entrypoint.sh"]

VOLUME /tmp
VOLUME $CATALINA_HOME/temp
VOLUME $CATALINA_HOME/work
VOLUME $CATALINA_HOME/logs
VOLUME $CATALINA_HOME/conf/Catalina

EXPOSE 8080
EXPOSE 8009

ENV CATALINA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

CMD ["catalina.sh", "run"]

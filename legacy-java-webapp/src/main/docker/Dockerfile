FROM tomcat:alpine

LABEL maintainer="D.R4F4EL <d.r4f4el@gmail.com>"
LABEL version="${project.version}"
LABEL description="${project.description}"

ARG HOST_UID
ARG HOST_GID

ENV TOMCAT_UID ${HOST_UID:-8080}
ENV TOMCAT_GID ${HOST_GID:-8080}

RUN set -ex; \
  apk add --no-cache 'su-exec>=0.2'; \
  addgroup tomcat -g $TOMCAT_GID -S; \
  adduser tomcat -u $TOMCAT_UID -G tomcat -g tomcat -H -h $CATALINA_HOME -s /sbin/nologin -S; \
  su-exec tomcat true; echo "OK"

RUN set -ex; \
  rm -rf $CATALINA_HOME/conf; \
  rm -rf $CATALINA_HOME/webapps/examples; \
  rm -rf $CATALINA_HOME/webapps/docs; \
  rm -rf $CATALINA_HOME/webapps/ROOT

COPY ./conf $CATALINA_HOME/conf
COPY ./${project.artifactId} $CATALINA_HOME/webapps/ROOT
COPY docker-entrypoint.sh $CATALINA_HOME/bin

RUN set -ex; \
  chmod +x $CATALINA_HOME/bin/docker-entrypoint.sh; \
  chown -R $TOMCAT_UID:$TOMCAT_GID $CATALINA_HOME

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080
EXPOSE 8009

CMD ["catalina.sh", "run"]

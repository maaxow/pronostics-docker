FROM tomcat:jdk8-adoptopenjdk-hotspot
ARG VERSION=1.0.0

MAINTAINER maaxow
#RUN echo $VERSION
RUN apt-get -qq update 
RUN apt-get -qq install -y wget

RUN wget -q -P /tmp/ https://github.com/maaxow/pronostics/releases/download/v$VERSION-beta/pronostics-$VERSION.war

RUN mv /tmp/pronostics-$VERSION.war /usr/local/tomcat/webapps/pronostics.war

EXPOSE 8080


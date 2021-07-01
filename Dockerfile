# TOMCAT
FROM tomcat:jdk8-adoptopenjdk-hotspot
MAINTAINER maaxow

ARG TAG=v1.0.1-beta
ARG WAR_FILE=pronostics-1.0.1.war

# Install wget
RUN apt-get -qq update 
RUN apt-get -qq install -y wget

# Download war file
RUN wget -q -P ./webapps https://github.com/maaxow/pronostics/releases/download/$TAG/$WAR_FILE

# Manage properties
ADD ./data/spring/application.properties /tmp/application.properties
RUN cat /tmp/application.properties >> ./conf/catalina.properties


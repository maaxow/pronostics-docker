# TOMCAT
FROM tomcat:jdk8-adoptopenjdk-hotspot
MAINTAINER maaxow

ARG TAG=v1.0.3-beta
ARG WAR_FILE=pronostics-1.0.3.war

# Install wget
RUN apt-get -qq update 
RUN apt-get -qq install -y wget

# Download war file
RUN wget -q -P ./webapps https://github.com/maaxow/pronostics/releases/download/$TAG/$WAR_FILE
RUN mv ./webapps/$WAR_FILE ./webapps/pronostics.war

# Manage properties
ADD ./data/spring/application.properties /tmp/application.properties
RUN mv /tmp/application.properties ./webapps/pronostics/WEB-INF/classes/spring/application.properties


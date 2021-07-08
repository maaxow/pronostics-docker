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
RUN mkdir -p /etc/pronostics/config
ADD ./data/spring/application.properties /etc/pronostics/config/application.properties
#RUN export spring_config_location=/etc/pronostics/config/application.properties

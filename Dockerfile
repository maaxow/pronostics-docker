# TOMCAT
FROM tomcat:jdk8-adoptopenjdk-hotspot
MAINTAINER maaxow

ARG TAG=v1.0.3-beta
ARG WAR_FILE=pronostics-1.0.3.war

# Install wget
RUN apt-get -qq update 
RUN apt-get -qq install -y wget

RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT

# Download war file
RUN wget -q -P ./webapps https://github.com/maaxow/pronostics/releases/download/$TAG/$WAR_FILE
RUN mv ./webapps/$WAR_FILE ./webapps/pronostics.war

# Manage properties
ADD ./data/spring/application.properties ./conf/application.properties

# Pronostics-docker

A project to build and run the project [https://github.com/maaxow/pronotics.git](pronostics) using docker.

## Building
`docker build -t tomcat-server --build-arg VERSION=1.0.0 .`

## Starting
`docker container run -it --publish 8081:8080 tomcat-server`

# Pronostics-docker

A project to build and run the project https://github.com/maaxow/pronotics using docker.

## Building

Use this command to build :

`docker-compose build [--build-arg TAG=v1.0.3] [--build-arg WAR_FILE=pronostics-1.0.3.war] .`

Optionnal args :
* TAG : tagname using in Release tab (ex: v1.0.3-beta)
* WAR_FILE : file of the war using in Release tab (ex: pronostics-1.0.3.war)

Both args must be match together

## Starting
`docker-compose up`

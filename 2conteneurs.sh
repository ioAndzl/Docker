#!/usr/bin/bash


#Lancement de conteneur
docker run -d --name c1 nginx:latest
docker run -d --name c1 -p 8080:80 nginx:latest
docker run -ti debian:latest 
docker run -ti --hostname c1 debian:latest
docker run -ti --rm --hostname c1 debian:latest
    avec le --rm quand on 'exit' le conteneur il est
    automatiquement supprimé
docker stop c1
docker start c1

docker rm -f c1

docker rm -f $(docker ps -aq)
    -q donne la liste des conteneurs actifs

docker run hello-world
docker run -d -p 8080:80 nginx #http://127.0.0.1:8080
docker exec -ti ID_RETOURNÉ_LORS_DU_DOCKER_RUN bash
cd /usr/share/nginx/html
docker stop ID_RETOURNÉ_LORS_DU_DOCKER_RUN
docker rm ID_RETOURNÉ_LORS_DU_DOCKER_RUN
docker pull hello-world
docker ps -a
docker images -a
docker system prune

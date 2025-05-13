docker volume
    ls 
    create 
    rm 
    inspect

docker volume create mynginx
docker run -d --name c1 -v mynginx:/usr/share/nginx/html/ nginx:latest
docker exec -ti c1 bash


docker volume inspect mynginx
ls /var/lib/docker/volumes/mynginx/_data

docker run -ti --name c2 --rm -v mynginx:/data debian latest
    cat /data/index.html

docker run -d --name c1 --mount type=bind,source=/data/,destination=/usr/share/nginx/html/ nginx:latest
    docker exec -ti c1 bash
    docker inspect --format "{{.Mounts}}" c1

docker run -d --name c1 --mount type=volume,source=mynginx,destination=/usr/share/nginx/html/ nginx:latest

docker run -d --name c1 --mount type=tmpfs,destination=/usr/share/nginx/html/ nginx:latest
    comportement de type bind mount
    
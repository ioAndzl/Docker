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

usage:
    dans c1:
        echo toto > /usr/share/nginx/html/index.html
    dans le host: 
        cat /var/lib/docker/volumes/mynginx/_data/index.html

    docker run -ti --name c2 --rm -v mynginx:/data debian:latest
        cat /data/index.html (on retrouve toto)
        echo titi > /data/index.html

=====================================================================
trois types de montages:
sudo mkdir /data
sudo mkdir /data2
sudo touch /data/toto
sudo findmnt
sudo mount --bind /data/ /data2/
ls /data2/
sudo umount /data2/
sudo rm -rf /data2/

docker run -d --name c1 --mount type=bind,source=/data/,destination=/usr/share/nginx/html/ nginx:latest
    docker exec -ti c1 bash
    docker inspect --format "{{.Mounts}}" c1

docker run -d --name c1 --mount type=volume,source=mynginx,destination=/usr/share/nginx/html/ nginx:latest

docker run -d --name c1 --mount type=tmpfs,destination=/usr/share/nginx/html/ nginx:latest
    comportement de type bind mount
    
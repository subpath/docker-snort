dir=$1

docker run  -v $dir:/opt -it --rm --net=host --cap-add=NET_ADMIN linton/docker-snort /bin/bash

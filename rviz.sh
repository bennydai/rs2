# This script launches a docker instance

xhost +local:docker

docker-compose -f docker-compose.yaml run rviz
docker-compose -f docker-compose.yaml stop rviz


#####################################
# Docker machine
#####################################
https://docs.docker.com/machine/get-started/#run-containers-and-experiment-with-machine-commands

With the advent of Docker for Windows as replacements for Docker Toolbox, 
we recommend that you use these for your primary Docker workflows. 
You can use these applications to run Docker natively on your local 
system without using Docker Machine at all. 
For now, however, if you want to create multiple local machines, 
you still need Docker Machine to create and manage machines for multi-node 
experimentation. Docker for Windows include the newest version of 
Docker Machine, so when you install either of these, you get docker-machine.

NOTE: Setup new external switch:
https://docs.docker.com/machine/drivers/hyper-v/#3-reboot

docker-machine create -d hyperv --hyperv-virtual-switch ExternalVirtualSwitch default

docker-machine create --driver hyperv default
docker-machine ls
docker-machine create --driver hyperv default
docker-machine start default
docker-machine stop default
docker-machine ip default
docker-machine env default
# Run this command to configure your shell:
# eval "$(docker-machine env default)"

#####################################

docker version
docker ps
docker ps -a
docker images
docker pull ubuntu:14.04
docker images
docker rmi ubuntu:14.04

docker start <container> 
docker stop <container>

docker rm <container>

# WEB page
docker run -d --name web -p 8080:8080 nigelpoulton/pluralsight-docker-ci
docker inspect web
http://localhost:8080/

# Ubuntu
docker run -it --name temp ubuntu:latest /bin/bash
exit (container exit)
Ctrl P + Q (Leave container but leave it alive)¨

docker container ls

# Stop containers
docker stop $(docker ps -aq)

# Remove containers
docker rm $(docker ps -aq)

# Remove images
docker rmi $(docker images)

# SWARM
## Engine port: 2375
## Secure Engine port: 2376
## Swarm port: 2377

root@mgr1: docker swarm init --advertise-addr 192.168.0.14:2377 --listen-addr 192.168.0.14:2377

# Find out token
docker swarm join-token manager
docker swarm join-token worker

root@mgr2: docker swarm join --token xxx 172.31.12.161:2377 --advertise-addr 172.31.12.162:2377 --listen-addr 172.31.12.162:2377

docker node ls (can be run only on worker node)

# SERVICES
docker service create --name psight1 -p 8080:8080 --replicas 5 nigelpoulton/pluralsight-docker-ci
docker service ls
docker service inspect psight1

docker swarm init
docker swarm join --token SWMTKN-1-2j72jht4tny02s9apxiiqwvdxb5zx7ble2touzb97dekprfrcy-3tef1b312096c8v61sobo0c4w 192.168.65.2:2377
docker service ps psight1 

docker service rm psight1

-------------

docker network create -d overlay ps-net
docker network ls

docker service create --name psight2 --network ps-net -p 8080:8080 --replicas 5 nigelpoulton/tu-demo:v1
docker service inspect --pretty psight2
https://github.com/docker/example-voting-app

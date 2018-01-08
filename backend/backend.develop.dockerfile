# Set env:
# docker-machine ls
# docker-machine env default
# eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env default)
# docker-machine ip
# Build image: docker build -f backend.develop.dockerfile -t <your username>/node_wheather_backend:v1.0 .

# Run container: 
# docker run -d -p 9000:9000 --name weather_backend <your username>/node_wheather_backend:v1.0 start
# docker run -d -p 9000:9000 --name weather_backend <your username>/node_wheather_backend:v1.0 dev
# docker run -d -p 9000:9000 --name weather_backend <your username>/node_wheather_backend:v1.0 lint

# Cleanup
# docker ps -l
# docker stop <id>
# docker rm <id>
# docker images
# docker rmi -v <image id>

FROM node:latest

MAINTAINER Kimmo Tuokkola

ENV NODE_ENV=development 
ENV PORT=9000
ENV APP_HOME=/app

# An API key to make queries in the https://github.com/Eficode/weatherapp
ENV APPID=bccf96598c0818836346cb8f69314912

RUN mkdir $APP_HOME
ADD . $APP_HOME
WORKDIR $APP_HOME

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "run"]

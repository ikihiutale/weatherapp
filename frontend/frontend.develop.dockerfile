# Build image: docker build -f frontend.develop.dockerfile -t <your username>/node_wheather_frontend:v1.0 .

# Run container: 
# Option 1
# Start Backend (Node / Koe) and Frontend (Webpack / React / Node) so that  
# link Frontend to Backend container with legacy linking.
# docker run -d -p 9000:9000 --name weather_backend <your username>/node_wheather_backend:v1.0 -- dev
# docker run -d -p 8000:8000 --link weather_backend:backend --name weather_frontend <your username>/node_wheather_frontend:v1.0 -- start

# Option 2: Create a custom bridge network and add containers into it
# docker network create --driver bridge weather_network
# docker run -d -p 9000:9000 -v $(PWD):/app --net=weather_network --name weather_backend <your username>/node_wheather_backend:v1.0 dev
#
# docker run -d -p 8000:8000 -v $(PWD):/app --net=weather_network --name weather_frontend <your username>/node_wheather_frontend:v1.0 start
# docker run -d -p 8000:8000 -v $(PWD):/app --net=weather_network --name weather_frontend <your username>/node_wheather_frontend:v1.0 lint


FROM node:latest

MAINTAINER Kimmo Tuokkola

ENV NODE_ENV=development 
ENV ENDPOINT=http://0.0.0.0:9000/api
ENV PORT=8000
ENV APP_HOME=/app

COPY . /$APP_HOME
WORKDIR $APP_HOME

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "run"]

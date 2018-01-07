# Build image: docker build -f frontend.develop.dockerfile -t wheather_backend/v1 .

# Option 1
# Start Frontend (Webpack / React / Node) and Backend (Node / Koe) 
# and link Frontend to Backend container with legacy linking.
#
# docker run -d --name my-mongodb mongo
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp danwahlin/node

# Option 2: Create a custom bridge network and add containers into it

# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 danwahlin/node

# Seed the database with sample database
# Run: docker exec nodeapp node dbSeeder.js

FROM node:latest

MAINTAINER Kimmo Tuokkola

ENV NODE_ENV=development 
ENV PORT=9000

COPY      . /var/www
WORKDIR   /var/www

RUN       npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]
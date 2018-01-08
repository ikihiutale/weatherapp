# Build image: docker build -f frontend.develop.dockerfile -t <your username>/node_wheather_frontend:v1.0 .

# Run container: 
# docker run -p 8000:8000 --name weather_frontend <your username>/node_wheather_frontend:v1.0 start
# docker run -p 8000:8000 <your username>/node_wheather_frontend:v1.0 lint


FROM node:latest

ENV NODE_ENV=development 
ENV ENDPOINT=http://0.0.0.0:9000/api
ENV PORT=8000
ENV APP_HOME=/app

COPY . $APP_HOME
WORKDIR $APP_HOME

RUN npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "run"]

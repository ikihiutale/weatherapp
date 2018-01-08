# Weatherapp

There was a beautiful idea of building an app that would show the upcoming weather. The developers wrote a nice backend and a frontend following the latest principles and - to be honest - bells and whistles. However, the developers did not remember to add any information about the infrastructure or even setup instructions in the source code.

Luckily we now have [docker compose](https://docs.docker.com/compose/) saving us from installing the tools on our computer, and making sure the app looks (and is) the same in development and in production. All we need is someone to add the few missing files!

## Prerequisites

* An [openweathermap](http://openweathermap.org/) API key.
* [Docker](https://www.docker.com/) and [docker compose](https://docs.docker.com/compose/) installed.

## Returning your solution

### Via github

* Make a copy of this repository in your own github account (do not fork unless you really want to be public).
* Create a personal repository in github.
* Make changes, commit them, and push them in your own repository.
* Send us the url where to find the code.

### Via tar-package

* Clone this repository.
* Make changes and **commit them**.
* Create a **.tgz** -package including the **.git**-directory, but excluding the **node_modules**-directories.
* Send us the archive.

## Exercises

There are a few things you must do to get the app up and running. After that there are a few things you can do to make it better.

### Mandatory

* Get yourself an API key to make queries in the [openweathermap](http://openweathermap.org/).

* Either run the app locally (using `npm i && npm start`) or move to the next step.

* Add **Dockerfile**'s in the *frontend* and the *backend* directories to run them virtually on any environment having [docker](https://www.docker.com/) installed. It should work by saying e.g. `docker build -t weatherapp_backend . && docker run --rm -i -p 9000:9000 --name weatherapp_backend -t weatherapp_backend`. If it doesn't, remember to check your api key first.

* Add a **docker-compose.yml** -file connecting the frontend and the backend, enabling running the app in a connected set of containers.

### Optional (do as many as you like)

* The application now only reports the current weather. It should probably report the forecast e.g. a few hours from now. (tip: [openweathermap api](https://openweathermap.org/forecast5))

* The developers are still keen to run the app and its pipeline on their own computers. Share the development files for the container by using volumes, and make sure the containers are started with a command enabling hot reload.

* There are [eslint](http://eslint.org/) errors. Sloppy coding it seems. Please help.

* The app currently reports the weather only for location defined in the *backend*. Shouldn't it check the browser location and use that as the reference for making a forecast? (tip: [geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation))

* There are no tests. Where are the tests? (tip: [mocha](https://mochajs.org/) or [robot framework](http://robotframework.org/)) Disclaimer: this is not an easy task. If you really want to try writing robot tests, start by creating a third container that gives expected weather data, and direct the backend queries there by redefining the **MAP_ENDPOINT**.

* Set up the weather service in a free cloud hosting service, e.g. [AWS](https://aws.amazon.com/free/) or [Google Cloud](https://cloud.google.com/free/).

* Write [ansible](http://docs.ansible.com/ansible/intro.html) playbooks for installing [docker](https://www.docker.com/) and the app itself.

# Solution 

# Development 

Windows 10 OS

Install the newest Node version 
Upgrade npm 

## Copy and create develop branch

```
https://github.com/Eficode/weatherapp -> download zip file -> extract to c:/eficode/weatherapp
open Git Bash to c:/eficode/weatherapp
git init
git add .
git commit -m "Copy and create develop branch"
git remote add origin https://github.com/ikihiutale/weatherapp.git
git push -u origin master
git checkout -b develop
```

## Environment

* The http://openweathermap.org/ APPID key value set to the wheather/backend/backend.develop.dockerfile file: ENV APPID=xxxx

* Installed Docker Toolbox for Windows: https://docs.docker.com/toolbox/toolbox_install_windows/

## Dockerfile

### Backend

Build image: 
```
docker build -f backend.develop.dockerfile -t <your username>/node_wheather_backend:v1.0 .
```
Run container: 
```
docker run -d -p 9000:9000 -v $(PWD):/app --name weather_backend <your username>/node_wheather_backend:v1.0 start

docker run -d -p 9000:9000 -v $(PWD):/app --name weather_backend <your username>/node_wheather_backend:v1.0 dev

docker run -d -p 9000:9000 -v $(PWD):/app --name weather_backend <your username>/node_wheather_backend:v1.0 lint
```

### Frontend

Build image: 
```
docker build -f frontend.develop.dockerfile -t <user name>/node_wheather_frontend:v1.0 .
```
Run container:
```
docker run -d -p 8000:8000 -v $(PWD):/app --name weather_frontend <your username>/node_wheather_frontend:v1.0 start

docker run -d -p 8000:8000 -v $(PWD):/app --name weather_frontend <your username>/node_wheather_frontend:v1.0 lint
```

## docker-compose.yml

Build & run:
```
docker-compose build

docker-compose up
```

Cleanup:
```
Run docker-compose down -v: 
```

### TODO

I didn't get the volumes up & running..
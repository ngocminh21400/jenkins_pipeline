# FROM node:12.22-slim
# WORKDIR /usr/src/app

# COPY . .
# RUN chmod u+x ./my-script.sh
# RUN ./my-script.sh

# EXPOSE 4200
# EXPOSE 8080

#FROM node:10-alpine as build-step
#RUN mkdir -p /app

#WORKDIR /usr/src/app
#COPY package.json /app
#COPY . .
#RUN npm install -g json-server
#RUN npm start
#EXPOSE 8080

FROM nginx:1.17.1-alpine

#COPY ./dist/projectAngular /usr/share/nginx/html
COPY package.json /usr/share/nginx/html
COPY dist/projectAngular /usr/share/nginx/html

#RUN --from=build-step npm start

EXPOSE 80

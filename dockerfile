FROM node:10-alpine as build-step
#RUN mkdir -p /app

WORKDIR /usr/src/app
#COPY package.json /app
COPY . .
#RUN npm install -g json-server
#RUN npm start
#EXPOSE 8080

FROM nginx:1.17.1-alpine
COPY --from=build-step /usr/src/app/dist/projectAngular /usr/share/nginx/html

#RUN --from=build-step npm start

EXPOSE 80
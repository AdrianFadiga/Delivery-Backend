FROM node:16-alpine

WORKDIR /app-backend

COPY . /app-backend

RUN npm i
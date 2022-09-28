FROM node:16-alpine

WORKDIR /app-backend

COPY . /app-backend

RUN npm i

CMD [ "npm", "run", "start:dev" ]
FROM node:lts-alpine as build-stage

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package*.json ./
COPY .env ./

RUN npm install
RUN npm install -g @vue/cli

COPY . .

CMD ["npm", "run", "serve"]
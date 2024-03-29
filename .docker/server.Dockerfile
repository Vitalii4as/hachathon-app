FROM node:lts-alpine as build

WORKDIR /app
COPY ./package.json /app/package.json

RUN npm install --no-optional --production
RUN npm audit fix

COPY . /app

RUN npm run build

ENTRYPOINT ["npm", "start"]
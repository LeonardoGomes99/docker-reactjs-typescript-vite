FROM node:latest

ARG APP_NAME

RUN mkdir /usr/src/app

ADD ${APP_NAME} /usr/src/app

WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

RUN npm install @types/react@latest @types/react-dom@latest --dev
RUN npm install react-scripts
RUN rm -rf node_modules
RUN rm -f package-lock.json
RUN npm cache clean --force
RUN npm install

CMD npm run dev
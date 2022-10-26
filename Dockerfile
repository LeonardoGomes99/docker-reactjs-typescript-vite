FROM node:latest

ARG APP_NAME

RUN mkdir /usr/src/app

ADD ${APP_NAME} /usr/src/app

WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

RUN yarn add @types/react@latest @types/react-dom@latest --dev
RUN yarn add react-scripts
RUN rm -rf node_modules
RUN rm -f package-lock.json
RUN yarn cache clean --force
RUN yarn install

CMD yarn run dev

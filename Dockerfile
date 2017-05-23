FROM node:7.10.0

RUN mkdir module

RUN npm install -g nodemon
RUN npm install -g eslint
RUN npm install -g mocha
RUN npm install -g nyc

ONBUILD COPY ./package.json /module
ONBUILD RUN npm install

ONBUILD COPY /.eslintrc /module

RUN mkdir /module/src
RUN mkdir /module/test

WORKDIR /module

CMD ["nodemon", "/module/src/index.js"]

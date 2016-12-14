FROM node:7.1-alpine

RUN apk update && apk upgrade && apk add --no-cache bash git curl

RUN git clone https://github.com/prerender/prerender.git  /opt/prerender/

WORKDIR /opt/prerender/
EXPOSE 3000

COPY ./server.js /opt/prerender/server.js
RUN npm install

CMD ["npm start"]
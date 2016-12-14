FROM node:7.1

RUN apt-get update && apt-get install git curl

RUN git clone https://github.com/prerender/prerender.git  /opt/prerender/

RUN apt-get remove git -y && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/prerender/
EXPOSE 3000
COPY ./server.js /opt/prerender/server.js

RUN npm install

CMD ["npm start"]
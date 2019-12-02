FROM node:7
WORKDIR /tmp
RUN npm install
ADD index.js /tmp/index_d.js
CMD node /tmp/index_d.js
EXPOSE 8080
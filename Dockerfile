FROM node:7
WORKDIR /tmp
RUN npm install
ADD index_d.js /tmp/index_d.js
CMD node /tmp/index_d.js
EXPOSE 8080
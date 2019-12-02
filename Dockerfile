FROM node:7
WORKDIR /tmp
RUN npm install
ADD index.js /tmp/index.js
CMD node /tmp/index.js
EXPOSE 8080
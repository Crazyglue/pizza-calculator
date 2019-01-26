FROM node:8

# Create app directory
WORKDIR /usr/src/app

COPY . .

RUN npm install

RUN npm run build

EXPOSE 8080
CMD [ "npm", "start" ]

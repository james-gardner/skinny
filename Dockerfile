FROM risingstack/alpine:3.3-v4.2.6-1.1.3

COPY package.json package.json  

RUN npm install -g nodemon

RUN npm install

RUN apk update

RUN apk get postgressql postgressql-client

# Add your source files
COPY . .  

EXPOSE  3000

CMD ["npm","start"]  
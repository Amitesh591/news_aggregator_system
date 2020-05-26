# use a node base image
FROM node:10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
COPY . .



# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://192.168.0.3:3000 || exit 1

# tell docker what port to expose
EXPOSE 3000
CMD ["node" , "app.js"]

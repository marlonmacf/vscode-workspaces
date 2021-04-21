# Specifying a base image
FROM node:alpine

# Specifying a working directory
WORKDIR /usr/app

# Copying only required config for npm install
COPY ./package.json ./

# Install some dependencies
RUN npm install

# Copying all build files
COPY ./ ./

# Default commands
CMD ["npm", "start"]
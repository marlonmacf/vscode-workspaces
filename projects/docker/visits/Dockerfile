# Specifying a base image
FROM node:alpine

# Specifying a working directory
WORKDIR /app

# Copying the node config file
COPY package.json .

# Install some dependencies
RUN npm install

# Copying all the build files
COPY . .

# Default commands
CMD ["npm", "start"]
# Use a newer official Node runtime as a parent image
# Make sure to use a version of the Node image that includes Node.js v16.14 or higher
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json, pnpm-lock.yaml (if you have one) into the directory
COPY package.json pnpm-lock.yaml ./

# Install 'pnpm' globally and install your dependencies
RUN npm install -g pnpm && pnpm i

# Copy the rest of your app's source code into the working directory
COPY . .

# Build the application
RUN pnpm build

# The command to run your application when the container starts
CMD ["pnpm", "dev"]

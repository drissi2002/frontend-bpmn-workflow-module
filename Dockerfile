# Use Node.js 16.13.0 as the base image
FROM node:16.13.0

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm ci --only=production

# Copy the entire project to the container
COPY . .

# Expose the port on which the Angular app will run (default is 4200)
EXPOSE 4200

# Start the Angular app using ng serve
CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
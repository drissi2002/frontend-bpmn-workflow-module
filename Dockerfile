# Use official Node.js Alpine image as the base image
FROM node:16.13.0-alpine

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to the app directory
COPY ./ /usr/local/app/

# Install dependencies
RUN npm ci --only=production

# Install Angular CLI globally
RUN npm install -g @angular/cli@14.2.7

# Expose the port on which the Angular app will run (default is 4200)
EXPOSE 4200

# Start the Angular app using ng serve
CMD ["ng", "serve", "--host", "0.0.0.0"]
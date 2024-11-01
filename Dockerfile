# First stage: build the Vue.js app
FROM --platform=amd64 node:20-alpine AS build-stage

# Set the working directory
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the entire app source
COPY . .

# Build the app
RUN npm run build

# Second stage: serve the app with a lightweight web server
FROM nginx:alpine

# Copy the built files from the previous stage to nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80 to serve the app
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

# Description: Dockerfile for the frontend of the React project

# Using the official nginx image as the base image
FROM nginx 

# Update apt ,install nodejs and npm    
RUN apt-get update && apt-get install -y curl && \
    apt-get install -y nodejs && \
    apt-get install -y npm

# Copy the current directory contents into the container at /app
COPY . /app

# Change the working directory to /app
WORKDIR /app

# Inatall the dependencies and build the project
RUN npm install && npm run build

# Copy the build folder to the nginx html folder
RUN cp -r /app/build/* /usr/share/nginx/html

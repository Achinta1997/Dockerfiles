FROM nginx 
RUN apt-get update && apt-get install -y curl && \
    apt-get install -y nodejs && \
    apt-get install -y npm

COPY . /app

WORKDIR /app
RUN npm install && npm run build


RUN cp -r /app/build/* /usr/share/nginx/html

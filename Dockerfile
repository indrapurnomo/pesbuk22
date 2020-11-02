FROM nginx

RUN apt-get update && docker-php-ext-install pdo_mysql mysqli pdo

COPY . /usr/share/nginx/html/

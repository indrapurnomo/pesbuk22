#FROM php:7.3.22-apache-stretch

#RUN apt-get update && docker-php-ext-install pdo_mysql mysqli pdo

#WORKDIR /var/www/html/

FROM indradock/pesbuk:1.0

WORKDIR /usr/share/nginx/html/

COPY . .

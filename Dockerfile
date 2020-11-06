#FROM php:7.3.22-apache-stretch

#RUN apt-get update && docker-php-ext-install pdo_mysql mysqli pdo

#WORKDIR /var/www/html/

FROM php:7.2-fpm

MAINTAINER 

WORKDIR /var/www/html

RUN apt-get update -y \
    && apt-get install -y nginx \
    && docker-php-ext-install mysqli pdo pdo_mysql 

COPY . .

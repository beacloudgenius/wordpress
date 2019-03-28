#
#       .
#        ":"
#      ___:____     |"\/"|
#    ,'        `.    \  /
#    |  O        \___/  |
#  ~^~^~^~^~^~^~^~^~^~^~^~^~

# The wordpress container

FROM wordpress
MAINTAINER Nilesh <nilesh@cloudgeni.us>

RUN  docker-php-ext-install mbstring

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client graphviz \
    && pecl install mcrypt-1.0.2 && docker-php-ext-enable mcrypt

RUN apt-get update && apt-get install -y zlib1g-dev libzip-dev \
    && docker-php-ext-install zip

COPY docker-php-ext-filesize.ini /usr/local/etc/php/conf.d/docker-php-ext-filesize.ini

COPY favicon.ico /var/www/html
RUN  chown www-data:www-data /var/www/html/favicon.ico

COPY .htaccess /var/www/html
RUN  chown www-data:www-data /var/www/html/.htaccess

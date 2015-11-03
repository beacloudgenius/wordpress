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
RUN pecl install zip
COPY docker-php-ext-zip.ini /usr/local/etc/php/conf.d/docker-php-ext-zip.ini
COPY docker-php-ext-filesize.ini /usr/local/etc/php/conf.d/docker-php-ext-filesize.ini

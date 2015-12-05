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

RUN  apt-get update && apt-get install -y \
         libmcrypt-dev \
     && docker-php-ext-install mcrypt

RUN  docker-php-ext-install zip

COPY docker-php-ext-filesize.ini /usr/local/etc/php/conf.d/docker-php-ext-filesize.ini

COPY favicon.ico /var/www/html
RUN  chown www-data:www-data /var/www/html/favicon.ico

RUN cat > .htaccess <<-'EOF'  \
    # BEGIN WordPress  \
    <IfModule mod_rewrite.c>  \
    RewriteEngine On  \
    RewriteBase /  \
    RewriteRule ^index\.php$ - [L]  \
    RewriteCond %{REQUEST_FILENAME} !-f  \
    RewriteCond %{REQUEST_FILENAME} !-d  \
    RewriteRule . /index.php [L]  \
    </IfModule>  \
    # END WordPress  \
    <FilesMatch "\.(ttf|otf|eot|woff)$">  \
    <IfModule mod_headers.c>  \
    Header set Access-Control-Allow-Origin "*"  \
    </IfModule>  \
    </FilesMatch>  \
    EOF
RUN chown www-data:www-data .htaccess

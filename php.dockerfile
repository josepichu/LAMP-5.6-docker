FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
     && docker-php-ext-install -j$(nproc) mcrypt mysqli  pdo pdo_mysql \
     && a2enmod rewrite

# docker build -t php-mysql -f php.dockerfile .
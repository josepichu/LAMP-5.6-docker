FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
     && docker-php-ext-install -j$(nproc) mcrypt mysqli  pdo pdo_mysql \
     && a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer     

# docker build -t php-mysql -f php.dockerfile .
FROM php:5.6-apache

# fix https://unix.stackexchange.com/questions/743839/apt-get-update-failed-to-fetch-debian-amd64-packages-while-building-dockerfile-f
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libzip-dev \
        zip
RUN docker-php-ext-configure zip --with-libzip 
RUN docker-php-ext-install -j$(nproc) mcrypt mysqli  pdo pdo_mysql zip
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer     

# docker build -t php-mysql -f php.dockerfile .
FROM php:7.1-fpm

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --enable-intl --enable-opcache --enable-zip
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN \
  apt-get install -y \
  libcurl4-gnutls-dev \
  libxml2-dev \
  libssl-dev \
  g++ \
  autoconf \
  libbz2-dev \
  libltdl-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  libxpm-dev \
  libimlib2-dev \
  libicu-dev \
  libmcrypt-dev \
  libxslt1-dev \
  re2c \
  libpng++-dev \
  libvpx-dev \
  zlib1g-dev \
  libgd-dev \
  libtidy-dev \
  libmagic-dev \
  libexif-dev \
  file \
  libssh2-1-dev \
  libjpeg-dev \
  libbrotli-dev \
  git \
  curl \
  wget \
  librabbitmq-dev \
  libzip-dev \
  libmagickwand-dev \
  --no-install-recommends

RUN \
    /usr/local/bin/docker-php-ext-install \
    pdo \
    sockets \
    pdo_mysql \
    mysqli \
    mbstring \
    hash \
    simplexml \
    xsl \
    soap \
    intl \
    bcmath \
    json \
    opcache \
    dom \
    pcntl \
    zip \
    curl \
    mcrypt

RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN rm -rf /var/www/html/*

RUN chown -R www-data:www-data /var/www/
RUN chmod -R g+w /var/www/

RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    && docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

ENV DEBIAN_FRONTEND teletype

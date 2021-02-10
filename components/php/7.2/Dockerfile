FROM php:7.3-fpm-alpine

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --enable-intl --enable-opcache --enable-zip

RUN apk add --virtual .deps --update --no-cache \
  bash \
  make \
  gcc \
  autoconf \
  curl \
  curl-dev \
  g++ \
  freetype-dev \
  icu \
  icu-dev \
  libjpeg-turbo-dev \
  imagemagick \
  imagemagick-dev \
  libpng-dev \
  libxml2-dev \
  libzip-dev \ 
  libxslt-dev \
  shadow \
  zlib-dev

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
  curl

RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install xdebug-2.9.0 && docker-php-ext-enable xdebug

RUN rm -rf /var/www/html/*

RUN chown -R www-data:www-data /var/www/
RUN chmod -R g+w /var/www/

RUN docker-php-ext-configure gd \
  --with-freetype-dir=/usr \
  --with-jpeg-dir=/usr \
  --with-png-dir=/usr \
  && docker-php-ext-install gd

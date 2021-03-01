FROM php:7.4-fpm-alpine

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
  zlib-dev \
  oniguruma-dev \
  &&  /usr/local/bin/docker-php-ext-install \
  sockets \
  pdo_mysql \
  mysqli \
  xsl \
  soap \
  intl \
  bcmath \
  opcache \
  pcntl \
  zip

RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install xdebug-2.9.0 && docker-php-ext-enable xdebug

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*

# Set www-data as owner for /var/www
RUN chown -R www-data:www-data /var/www/
RUN chmod -R g+w /var/www/

RUN docker-php-ext-configure gd \
  --with-freetype \
  --with-jpeg \
  && docker-php-ext-install gd

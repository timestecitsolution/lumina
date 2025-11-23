FROM php:8.2-cli

# system packages
RUN apt-get update && apt-get install -y \
    zip unzip git libzip-dev libpng-dev libonig-dev libxml2-dev

# PHP extensions
RUN docker-php-ext-install pdo_mysql zip

# install composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . .

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
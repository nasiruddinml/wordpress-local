# use the official wordpress image as the base
FROM wordpress:latest

# install php redis extension and enable it 
RUN pecl install docker-php-ext-enable redis

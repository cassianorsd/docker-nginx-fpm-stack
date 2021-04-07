FROM php:7.4-fpm
RUN apt update
RUN docker-php-ext-install pdo_mysql
RUN apt install -y libzip-dev libpq-dev freetds-common freetds-dev \
libdbd-freetds tdsodbc freetds-bin libct4 libsybdb5 firebird-dev \
libldap2-dev unixodbc unixodbc-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_pgsql pgsql
RUN ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/
RUN docker-php-ext-install pdo_dblib
RUN docker-php-ext-install pdo_firebird

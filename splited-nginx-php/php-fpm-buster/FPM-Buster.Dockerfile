FROM debian:buster
RUN apt update
RUN apt install -y php-fpm
RUN sed -i '/^listen/c listen = 0.0.0.0:9000' /etc/php/7.3/fpm/pool.d/www.conf
RUN apt install -y php-dom php-mbstring php-curl \
php-zip php-sqlite3 php-mysql php-pgsql php-sybase \
php-interbase php-gd php-odbc
EXPOSE 9000
RUN mkdir -p /run/php/
CMD ["php-fpm7.3","-F"]

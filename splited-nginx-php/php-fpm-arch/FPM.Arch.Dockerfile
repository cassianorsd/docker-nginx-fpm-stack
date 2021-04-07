FROM archlinux:latest
RUN pacman -Syy --noconfirm --quiet > /dev/null
RUN pacman -S --noconfirm --needed php-fpm
RUN sed -i '/^listen/c listen = 0.0.0.0:9000' /etc/php/php-fpm.d/www.conf
RUN pacman -S --noconfirm --quiet --needed php-gd php-ldap php-sqlite php-pgsql vim
RUN pacman -S --noconfirm --quiet --needed freetds unixodbc mysql php-dblib libfbclient php-odbc php7-odbc
RUN sed -i 's/;extension=gd/extension=gd/g' /etc/php/php.ini
RUN sed -i 's/;extension=iconv/extension=iconv/g' /etc/php/php.ini
RUN sed -i 's/;extension=mysql.so/extension=mysql.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=sqlite3/extension=sqlite3/g' /etc/php/php.ini
RUN sed -i 's/;extension=pdo_sqlite/extension=pdo_sqlite/g' /etc/php/php.ini
RUN sed -i 's/;extension=sqlite/extension=sqlite/g' /etc/php/php.ini
RUN sed -i 's/;extension=pgsql/extension=pgsql/g' /etc/php/php.ini
RUN sed -i 's/;extension=ldap/extension=ldap/g' /etc/php/php.ini
RUN sed -i 's/;extension=openssl/extension=openssl/g' /etc/php/php.ini
RUN sed -i 's/;extension=pdo_pgsql/extension=pdo_pgsql/g' /etc/php/php.ini
RUN sed -i 's/;extension=pdo_dblib/extension=pdo_dblib/g' /etc/php/php.ini
RUN sed -i 's/;extension=pdo_mysql/extension=pdo_mysql/g' /etc/php/php.ini
RUN sed -i 's/;extension=pdo_odbc/extension=pdo_odbc/g' /etc/php/php.ini
RUN sed -i 's/;extension=odbc/extension=odbc/g' /etc/php/php.ini
CMD ["php-fpm","-F"]

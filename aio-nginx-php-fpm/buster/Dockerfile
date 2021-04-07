FROM debian:buster
RUN apt update
RUN apt install -y ca-certificates gnupg nginx php-fpm supervisor 
RUN apt install -y php-dom php-mbstring php-gd php-zip php-curl php-interbase \ 
php-sqlite3 php-mysql php-pgsql php-sybase
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
	&& ln -sf /dev/stderr /var/log/php7.4-fpm.log
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
RUN mkdir -p /run/php/
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor.conf

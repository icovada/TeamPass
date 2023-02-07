FROM wyveo/nginx-php-fpm:php74

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade && apt-get install -y -o Dpkg::Options::="--force-confold" php7.4-gmp php7.4-ldap && rm -rf /var/cache/apt-get

ADD . /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/includes/libraries/csrfp/log && chown www-data:www-data /usr/share/nginx/html/includes/libraries/csrfp/log

RUN rm /usr/share/nginx/html/index.html
RUN sed -i 's/\/index\.php?\$query_string \$uri\/index\.html/=404/g' /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["/start.sh"]

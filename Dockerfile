FROM wyveo/nginx-php-fpm:php81

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y php8.1-gmp && rm -rf /var/cache/apt-get

ADD . /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/includes/libraries/csrfp/log && chown www-data:www-data /usr/share/nginx/html/includes/libraries/csrfp/log

EXPOSE 80
CMD ["/start.sh"]

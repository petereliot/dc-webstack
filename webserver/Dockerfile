FROM ubuntu:16.10
MAINTAINER Alexander Schenkel <alex@alexi.ch>
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.0 \
      php7.0-cli \
      libapache2-mod-php7.0 \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-pgsql \
      php7.0-sqlite3 \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip \
      php7.0-soap \
      php7.0-intl \
      php7.0-mcrypt \
      php7.0-curl \
      php7.0-imap

RUN apt-get install -y git
RUN apt-get install -y nano
RUN apt-get install -y net-tools
RUN apt-get install -y curl
RUN apt-get install -y golang-go
ENV GOPATH=/go
RUN go get github.com/mailhog/mhsendmail
RUN ln -s /go/bin/mhsendmail /usr/bin/mhsendmail
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN sed -i -e 's#;sendmail_path =#sendmail_path ="/usr/bin/mhsendmail --smtp-addr=mailhog:1025"#' /etc/php/7.0/apache2/php.ini
RUN sed -i -E 's#short_open_tag = (On|Off)#short_open_tag = On#' /etc/php/7.0/apache2/php.ini
RUN sed -i -E 's#display_errors = (On|Off)#display_errors = On#' /etc/php/7.0/apache2/php.ini
RUN sed -i -e 's#error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT#error_reporting = E_ALL \& ~E_NOTICE \& ~E_STRICT \& ~E_DEPRECATED#' /etc/php/7.0/apache2/php.ini
RUN sed -i '10i\\tHeader set Access-Control-Allow-Origin "*"' /etc/apache2/sites-available/000-default.conf

#COPY apache_default /etc/apache2/sites-available/000-default.conf
#COPY run /usr/local/bin/run
#RUN chmod +x /usr/local/bin/run

RUN a2enmod rewrite
RUN a2enmod headers
EXPOSE 81 443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["/usr/local/bin/run"]
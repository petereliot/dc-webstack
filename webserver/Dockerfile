FROM ubuntu:17.10
MAINTAINER Arthur GREGOIRE
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.1 \
      php7.1-cli \
      libapache2-mod-php7.1 \
      php7.1-gd \
      php7.1-json \
      php7.1-ldap \
      php7.1-mbstring \
      php7.1-mysql \
      php7.1-pgsql \
      php7.1-sqlite3 \
      php7.1-xml \
      php7.1-xsl \
      php7.1-zip \
      php7.1-soap \
      php7.1-intl \
      php7.1-mcrypt \
      php7.1-curl \
      php7.1-imap
RUN apt-get install -y git
RUN apt-get install -y nano
RUN apt-get install -y net-tools
RUN apt-get install -y curl
RUN apt-get install -y golang-go
ENV GOPATH=/go
RUN go get github.com/mailhog/mhsendmail
RUN ln -s /go/bin/mhsendmail /usr/bin/mhsendmail
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN sed -i -e 's#;sendmail_path =#sendmail_path ="/usr/bin/mhsendmail --smtp-addr=mailhog:1025"#' /etc/php/7.1/apache2/php.ini
RUN sed -i '10i\\tHeader set Access-Control-Allow-Origin "*"' /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN a2enmod headers
EXPOSE 81 443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
FROM drupal:7.43-apache
MAINTAINER Paul McCrodden <paul.mccrodden@x-team.com>

# Install packages.
RUN apt-get update
RUN apt-get install -y \
	vim \
	git \
	php5-cli \
	php5-xdebug \
	mysql-client \
	wget \
	iputils-ping \
	zip \
	unzip
RUN apt-get clean

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Drush via composer.
RUN composer global require drush/drush:dev-master

# Setup PHP.
COPY ./config/php-docker.ini /usr/local/etc/php/conf.d/
COPY ./config/php-docker.ini /etc/php5/cli/conf.d/

# Setup XDebug.
COPY ./config/xdebug-docker.ini /usr/local/etc/php/conf.d/
COPY ./config/xdebug-docker.ini /etc/php5/cli/conf.d/

FROM drupal:7.43-apache
MAINTAINER Paul McCrodden <paul.mccrodden@x-team.com>

# Install packages.
RUN apt-get update
RUN apt-get install -y \
	vim \
	git \
	php5-cli \
	php5-mysql \
	php5-gd \
	php5-curl \
	php5-xdebug \
	libapache2-mod-php5 \
	curl \
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
RUN composer global update
RUN composer global require drush/drush:dev-master

# Setup PHP.
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/cli/php.ini

# Setup Apache.
# In order to run our Simpletest tests, we need to make Apache
# listen on the same port as the one we forwarded. Because we use
# 8000 by default, we set it up for that port.
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www/' /etc/apache2/sites-available/000-default.conf
RUN echo "Listen 8000" >> /etc/apache2/ports.conf
RUN sed -i 's/VirtualHost \*:80/VirtualHost \*:\*/' /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

# Setup XDebug.
RUN echo "xdebug.max_nesting_level = 300" >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.max_nesting_level = 300" >> /etc/php5/cli/conf.d/20-xdebug.ini

EXPOSE 80

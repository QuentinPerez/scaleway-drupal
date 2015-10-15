## -*- docker-image-name: "scaleway/drupal:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Upgrade packages
RUN apt-get -q update \
  && apt-get --force-yes -y -qq upgrade \
  && apt-get install -y -qq php5 libapache2-mod-php5 php5-mcrypt php5-cli php5-mysql php5-gd php5-curl libssh2-php apache2 \
  && apt-get clean
 
ENV DRUPAL_VERSION 7.40
 
# Patches
ADD patches/etc/ /etc/
ADD patches/usr/ /usr/
ADD patches/root/ /root/

RUN a2enmod rewrite

RUN sed -i s/"expose_php = On"/"expose_php = Off"/g /etc/php5/apache2/php.ini \
  && sed -i s/"allow_url_fopen = On"/"allow_url_fopen = Off"/g /etc/php5/apache2/php.ini

# Install Drupal
RUN cd /var/www \
  && wget http://ftp.drupal.org/files/projects/drupal-$DRUPAL_VERSION.tar.gz \
  && tar xzf drupal-$DRUPAL_VERSION.tar.gz \
  && rm -rf /var/www/html \
  && rm -rf /var/www/drupal-$DRUPAL_VERSION.tar.gz \
  && mv drupal-$DRUPAL_VERSION html

RUN cd /var/www/html \
  && mkdir -p sites/default/files \
  && chmod a+w sites/default/files \
  && cp sites/default/default.settings.php sites/default/settings.php \
  && chmod a+w sites/default/settings.php

RUN chown -R www-data:www-data /var/www/html

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave

FROM ubuntu:trusty
MAINTAINER Junior Ribeiro


RUN apt-get -qq update 
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" >> /etc/apt/sources.list.d/php7.list  
RUN echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" >> /etc/apt/sources.list.d/php7.list  
#RUN add-apt-repository ppa:ondrej/php 
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C 
RUN apt-get -qq update 

RUN apt-get install -y php7.0 php7.0-fpm php7.0-mcrypt nginx npm nodejs curl git 
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
RUN npm install --save gulp-install 




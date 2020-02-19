# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lothieve <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/19 11:49:21 by lothieve          #+#    #+#              #
#    Updated: 2020/02/19 17:55:59 by lothieve         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER lothieve "lothieve@student.42.fr"

COPY ./srcs /srcs

RUN apt -y update
RUN apt -y install nginx
RUN apt -y install mariadb-server
RUN apt -y install php-fpm php-mysql
RUN apt -y install wget
RUN apt -y install libnss3-tools

#setup mysql
RUN service mysql start \
&& echo "CREATE DATABASE wordpress" | mysql -u root -ppassword\
&& echo "SET password FOR 'root'@'localhost' = password('password')" | mysql -u root -ppassword\
&& echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'password'" | mysql -u root -ppassword\
&& echo "FLUSH PRIVILEGES" | mysql -u root -ppassword

#SSL
RUN wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64
RUN chmod +x mkcert
RUN ./mkcert -install; ./mkcert localhost

#setup php
RUN mkdir /var/www/localhost
RUN mv /srcs/site_stuff/* /var/www/localhost/
RUN mv /srcs/nginx-conf /etc/nginx/sites-available/localhost
RUN chown -R $USER:$USER /var/www/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN nginx -t

#konichiwa wordpress chan UwU
RUN tar -xzvf /srcs/wordpress.tar.gz -C /var/www/localhost/
RUN cp /srcs/wp-config.php /var/www/localhost/wordpress/

#phpMyAdmin
RUN wget -O /srcs/phpMyAdmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xzvf /srcs/phpMyAdmin.tar.gz -C /var/www/localhost/
RUN mv /var/www/localhost/phpMyAdmin-4.9.0.1-all-languages/ /var/www/localhost/phpMyAdmin

CMD service php7.3-fpm start; service nginx start; service mysql start; bash

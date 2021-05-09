# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dohykim <dohykim@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 06:20:48 by dohykim           #+#    #+#              #
#    Updated: 2021/05/09 18:14:49 by dohykim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	maintainer="dohykim <dohykim@student.42seoul.kr>"

RUN		apt-get update && apt-get -y upgrade && apt-get -y install \
		nginx \
		php7.3-fpm \
		mariadb-server \
		php-mysql \
		php-mbstring \
		vim \
		openssl \
		wget

COPY	./srcs/run.sh ./
COPY	./srcs/default ./tmp
COPY	./srcs/wp-config.php ./tmp
COPY	./srcs/config.inc.php ./tmp

CMD		sh run.sh
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV NAGIOS_VER=4.4.6 \
    NAGIOS_PLUGINS_VER=2.3.3

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    apache2 php gcc make unzip libgd-dev \
    libapache2-mod-php build-essential libssl-dev \
    curl wget tar libmcrypt-dev libjpeg-dev libpng-dev \
    libperl-dev libdbi-dev default-libmysqlclient-dev \
    apache2-utils git

# Crear usuarios y grupos necesarios
RUN useradd nagios && \
    groupadd nagcmd && \
    usermod -a -G nagcmd nagios && \
    usermod -a -G nagcmd www-data

# Descargar y compilar Nagios Core
RUN cd /tmp && \
    wget https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-${NAGIOS_VER}/nagios-${NAGIOS_VER}.tar.gz && \
    tar xzf nagios-${NAGIOS_VER}.tar.gz && \
    cd nagios-${NAGIOS_VER} && \
    ./configure --with-command-group=nagcmd && \
    make all && \
    make install && \
    make install-init && \
    make install-commandmode && \
    make install-config && \
    make install-webconf

# Crear el usuario para la interfaz web
RUN htpasswd -cb /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

# Habilitar CGI en Apache
RUN a2enmod cgi

EXPOSE 80

CMD /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg & apache2ctl -D FOREGROUND
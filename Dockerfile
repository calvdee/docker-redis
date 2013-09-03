FROM	ubuntu
MAINTINER	Calvin De Lima

# Packages
RUN	apt-get update
RUN	apt-get install wget gcc make -y
RUN apt-get install python-software-properties python python-setuptools -y


ENV	REDIS_VERSION 2.6.16
ENV REDIS_BASE /opt/redis-$REDIS_VERSION

# Install Redis
ADD	http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz /tmp/
RUN	cd /tmp && tar -xvf redis-$REDIS_VERSION.tar.gz -C /opt
RUN cd $REDIS_BASE && make install
ADD	https://raw.github.com/calvdee/docker-redis/master/supervisord.conf $REDIS_BASE/

# Install supervisor
#RUN easy_install supervisor
#RUN echo_supervisord_conf > /etc/supervisord.conf
#RUN printf "[include]\nfiles = $REDIS_BASE/supervisord.conf\n" >> /etc/supervisord.conf


# Open the port
EXPOSE	6379:6379
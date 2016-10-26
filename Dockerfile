FROM		ubuntu:14.04
MAINTAINER	technopreneural@yahoo.com

VOLUME		["/var/cache/apt-cacher-ng"]

RUN		apt-get update \
		&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
			apt-cacher-ng \
		&& rm -rf /var/lib/apt/lists/*
		&& sed -i '/gentoo/s/^/#/' /etc/apt-cacher-ng/acng.conf

EXPOSE  	3142

CMD     	chmod 777 /var/cache/apt-cacher-ng \
		&& /etc/init.d/apt-cacher-ng start \
		&& tail -f /var/log/apt-cacher-ng/*

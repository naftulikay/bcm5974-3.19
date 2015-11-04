#!/usr/bin/make -f

PKG_NAME=bcm5974-4.2-dkms
PKG_VERSION=1.0.0
PKG_DESCRIPTION="Backported BCM-5974 module from kernel 4.2 including new MacBook hardware support."

MAINTAINER="Naftuli Tzvi Kay <rfkrocktk@gmail.com>"

all:
	test -d build || mkdir build
	fpm -f -s dir -t deb -n $(PKG_NAME) -v $(PKG_VERSION) -a all -p build/ \
		-d dkms -d build-essential -d linux-headers-generic-lts-vivid \
		-m $(MAINTAINER) --description $(PKG_DESCRIPTION) \
		--deb-changelog CHANGELOG \
		--post-install scripts/post-install.sh --pre-uninstall scripts/pre-uninstall.sh \
		--exclude '.git*' usr/

clean:
	rm build/*.deb

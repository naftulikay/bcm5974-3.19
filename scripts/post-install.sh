#!/bin/sh

set -e

dkms_name="bcm5974"
dkms_version="4.2"

case "$1" in
  configure)
    set +e
    dkms install $dkms_name/$dkms_version --all
    set -e
  ;;

  abort-upgrade|abort-remove|abort-deconfigure)
  ;;

  *)
    echo "postinst called with unknown argument: $1"
    exit 1
  ;;
esac

#DEBHELPER#

exit 0

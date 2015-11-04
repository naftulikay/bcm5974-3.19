#!/bin/sh

set -e

dkms_name="bcm5974"
dkms_version="4.2"

case "$1" in
  remove|upgrade|deconfigure)
    set +e
    dkms remove $dkms_name/$dkms_version --all
    set -e
  ;;

  failed-upgrade)
  ;;

  *)
    echo "prerm called with unknown argument: $1"
    exit 1
  ;;
esac

#DEBHELPER#

exit 0

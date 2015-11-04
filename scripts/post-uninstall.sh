#!/bin/sh

set -e

dkms_name="bcm5974"
dkms_version="4.2"

case "$1" in
  purge|remove|upgrade|failed_upgrade|abort-install|abort-upgrade|disappear)
    depmod

    if [ -d "/usr/src/$dkms_name-$dkms_version" ]; then
      echo "Removing old module source..."
      rm -fr "/usr/src/$dkms_name-$dkms_version"
    fi
  ;;

  *)
    echo "postrm called with an unknown argument: $1"
    exit 1
  ;;
esac

#DEBHELPER#

exit 0

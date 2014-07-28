#!/bin/bash

if [ ! -e /data/boot2docker ]
then
  echo 1>&2 "Must be run in boot2docker"
  echo 1>&2 "Run with -v /etc:/data"
  exit 1
fi

version="$(cat /data/version)"

if [ -e /root/build/$version ]
then
  echo 1>&2 "Found prebuilt modules for $version"
else
  echo 1>&2 "No prebuilt modules found for $version, building now"
  /root/build9p.sh "$version"
fi

echo 1>&2 "Installing to system"
install -D /root/build/$version/9pnet.ko /data/9p/9pnet.ko
install -D /root/build/$version/9p.ko /data/9p/9p.ko
if [ ! -e /etc/rc.local ]
then
    echo '#!/bin/sh' > /etc/rc.local
fi
echo 'insmod /etc/9p/9pnet.ko
insmod /etc/9p/9p.ko' >> /etc/rc.local

echo 1>&2 "Will try to insert now, may fail if not run with --privileged"

insmod /data/9p/9pnet.ko
insmod /data/9p/9p.ko



#!/sbin/sh

set -e

# Create symlinks to m8dug specific-blobs
basedir="/system/blobs/dug/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done

exit 0

#!/bin/sh -eux

apt-get -y autoremove
apt-get -y clean

# Remove docs
rm -rf /usr/share/doc/*

# Remove caches
find /var/cache -type f -exec rm -rf {} \;
rm -f /var/lib/apt/lists/*_Packages
rm -f /var/lib/apt/lists/*_InRelease
rm -f /var/lib/apt/lists/*_Translation-*

# delete any logs that have built up during the install
find /var/log/ -name *.log -exec rm -f {} \;


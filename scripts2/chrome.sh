#!/bin/sh -eux

cat <<CFG > /etc/apt/sources.list.d/google-chrome.list
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
CFG

apt-get update
apt-get install -y --allow-unauthenticated --no-install-recommends \
  google-chrome-stable chromium-browser chromium-chromedriver

sed -i 's/^[!#]/# /' /etc/apt/sources.list.d/google-chrome.list

apt-get update


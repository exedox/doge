#!/bin/sh
#Copy keys.txt to doge folder
if [ -e /keys/keys.txt ]; then
  cp /keys/keys.txt /nut/keys.txt
else
  echo "--- YOU MUST PLACE KEYS.TXT IN THE /keys MOUNTPOINT ---"
  exit 1
fi
#Set variables
if [ -n "${NUT_USER}" ]; then
  sed -i -e 's/AdMiN/'${NUT_USER}'/g' /nut/conf/users.conf
  echo "Nut user set to ${NUT_USER}"
fi

if [ -n "${NUT_PASSWD}" ]; then
  sed -i -e 's/nYsTIaNICHIm/'${NUT_PASSWD}'/g' /nut/conf/users.conf
  echo "Nut passwd set to ${NUT_PASSWD}"
fi

cd /server
node server.js

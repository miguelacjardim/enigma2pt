#!/bin/sh
opkg update
opkg install curl
#Change the URL to point to your Bouquet tar.gz file
BQ="https://github.com/miguelacjardim/enigma2pt/releases/download/1.0/enigma2.zip"
BP="https://github.com/miguelacjardim/enigma2pt/releases/download/1.0/picon.zip"
## Bouquet Download & Installation ##
cd /tmp
curl $BQ -Lko /tmp/enigma2.zip
chmod 755 /tmp/enigma2.zip
if find /tmp/enigma2.zip; then
  unzip enigma2.zip

  cd /tmp/enigma2
  rm -rf /etc/tuxbox/satellites.xml
  cp /tmp/enigma2/satellites.xml /etc/tuxbox
  cd /etc/tuxbox
  chmod 755 satellites.xml

  cd /etc/enigma2
  rm -rf *.tv
  rm -rf *.radio
  rm -rf blacklist
  rm -rf lamedb
  rm -rf cables.xml
  rm -rf satellites.xml
  rm -rf terrestrial.xml
  rm -rf SHOUTcast.favorites
  mv /tmp/enigma2/* /etc/enigma2
  cd /etc/enigma2
  chmod 755 satellites.xml

  rm -rf /tmp/enigma2.zip
  rm -rf /tmp/enigma2
  sleep 3
fi

cd /usr/share/enigma2/picon
rm -rf *.png
rm -rf *.db
sleep 1
cd /tmp
curl $BP -Lko /tmp/picon.zip
chmod 755 /tmp/picon.zip
if find /tmp/picon.zip; then
  unzip picon.zip
  rm -rf /usr/share/enigma2/picon
  mv /tmp/picon /usr/share/enigma2
  chmod 755 /usr/share/enigma2/picon
  rm -rf /tmp/picon.zip
  rm -rf /tmp/picon
  cd /usr/share/enigma2/picon
  rm -rf *db
  sleep 3
fi


wget http://localhost/web/servicelistreload?mode=0 -O /dev/null

exit



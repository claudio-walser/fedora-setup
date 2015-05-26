#!/bin/bash

SHORTCUT="[Desktop Entry]
Name=TeamSpeak 3
Comment=TeamSpeak 3
Exec=/usr/bin/teamspeak
Icon=/opt/teamspeak-3/logo.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Internet;"

if [ -d /opt/teamspeak-3 ]; then
  echo 'Teamspeak is already installed in /opt/. Remove it first, then call this script again'
  exit 0
fi

curl -L "http://dl.4players.de/ts/releases/3.0.16/TeamSpeak3-Client-linux_amd64-3.0.16.run" -o "/usr/src/teamspeak-install.run"
cd /usr/src
sh teamspeak-install.run
mv ./TeamSpeak3-Client-linux_amd64 /opt/teamspeak-3
curl -L "https://lh5.ggpht.com/lxTtzhs4vOmnDeYCn21VmT8aLNUQo46tkDsEB_p3EVT5It4iiQx16MpIZ_6p3Cy-Kv0=w300" -o /opt/teamspeak-3/logo.png
cd -

echo "${SHORTCUT}" > "/usr/share/applications/teamspeak-3.desktop"
ln -s /opt/teamspeak-3/ts3client_runscript.sh /usr/bin/teamspeak

echo "Teamspeak installed!"
exit 1

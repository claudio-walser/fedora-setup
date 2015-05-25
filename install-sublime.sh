#!/bin/sh
SHORTCUT="[Desktop Entry]
Name=Sublime Text 3
Comment=Edit text files
Exec=/opt/sublime_text_3/sublime_text
Icon=/opt/sublime_text_3/Icon/128x128/sublime-text.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;TextEditor;"
SCRIPT="#!/bin/sh
if [ \${1} == \"--help\" ]; then
/opt/sublime_text_3/sublime_text --help
else
/opt/sublime_text_3/sublime_text \$@ > /dev/null 2>&1 &
fi"

if [ -d /opt/sublime_text_3/sublime_text ]; then
  echo 'Sublime is already installed in /opt/. Remove it first"
  exit 0
fi

curl -L "http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3083_x64.tar.bz2" -o "/usr/src/Sublime Text 3.tar.bz2"
cd /usr/src
tar -xvjf "Sublime Text 3.tar.bz2"
mv ./sublime_text_3 /opt/
 
echo "${SCRIPT}" > "/usr/local/bin/sublime"
chmod +x "/usr/local/bin/sublime"
echo "${SHORTCUT}" > "/usr/share/applications/sublime-text-3.desktop"
ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime
 
echo "Finish!"
exit 1

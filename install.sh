#!/bin/bash

# install rpm-fusion free repository
dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# install rmp-fusion non-free repository
dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

# update and upgrade
dnf update
dnf upgrade

# tweak nautilus 3.6 to get new file back into context menu
runuser -l  $SUDO_USER -c "touch /home/${SUDO_USER}/Vorlagen/Neue\ Datei.txt"

# install some main packages now
dnf install gcc nano fuse-sshfs tomboy kernel-devel kernel-headers screen vlc gnome-tweak-tool libreoffice conky screenfetch alacarte pidgin amule \
            gstreamer-plugins-ugly gstreamer-plugin-crystalhd gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-vaapi gstreamer1-plugins-good gstreamer1-plugins-bad-free 

# install paper-gtk-theme and paper-icon-theme cause they are hot
runuser -l  $SUDO_USER -c "mkdir -p /home/${SUDO_USER}/Development/paper-gtk-theme"
runuser -l  $SUDO_USER -c "mkdir -p /home/${SUDO_USER}/Development/paper-icon-theme"

if [ ! -f /home/${SUDO_USER}/Development/paper-gtk-theme/install.sh ]; then
  runuser -l  $SUDO_USER -c "git clone https://github.com/snwh/paper-gtk-theme.git /home/${SUDO_USER}/Development/paper-gtk-theme"
fi

if [ ! -f /home/${SUDO_USER}/Development/paper-icon-theme/install-icon-theme.sh ]; then
  runuser -l  $SUDO_USER -c "git clone https://github.com/snwh/paper-icon-theme.git /home/${SUDO_USER}/Development/paper-icon-theme"
fi

if [ ! -d /usr/share/themes/Paper ]; then
  cd /home/${SUDO_USER}/Development/paper-gtk-theme/
  bash ./install.sh
  cd -
fi

if [ ! -d /usr/share/icons/Paper ]; then
  cd /home/${SUDO_USER}/Development/paper-icon-theme/
  bash ./install-icon-theme.sh
  cd -
fi

# install sublime text 3
sh ./install-sublime.sh

# some other dev tools
if [ ! -d /home/${SUDO_USER}/Development/reverse-engineering/fmk ]; then
  runuser -l  $SUDO_USER -c "mkdir -p /home/${SUDO_USER}/Development/reverse-engineering"
  runuser -l  $SUDO_USER -c "wget -P /home/${SUDO_USER}/Development/reverse-engineering/ https://firmware-mod-kit.googlecode.com/files/fmk_099.tar.gz"
  runuser -l  $SUDO_USER -c "tar -xvzf /home/${SUDO_USER}/Development/reverse-engineering/fmk_099.tar.gz -C /home/${SUDO_USER}/Development/reverse-engineering/"
  rm -rf /home/${SUDO_USER}/Development/reverse-engineering/fmk_099.tar.gz
fi

dnf install nmap

# set gnome window controls to the left, cause I like it more
#runuser -l  $SUDO_USER -c "gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'"

#!/bin/bash

# install rpm-fusion free repository
#yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# install rmp-fusion non-free repository
#yum localinstall --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

# update 
#yum update


# install vlc player from rpm-fusion now
#yum install vlc

# install paper-gtk-theme and paper-icon-theme cause they are hot
runuser -l  $SUDO_USER -c "mkdir -p /home/${SUDO_USER}/Development/paper-gtk-theme"
runuser -l  $SUDO_USER -c "mkdir -p /home/${SUDO_USER}/Development/paper-icon-theme"

if [ ! -f /home/${SUDO_USER}/Development/paper-gtk-theme/install.sh ]; then
  runuser -l  $SUDO_USER -c "git clone https://github.com/snwh/paper-gtk-theme.git /home/${SUDO_USER}/Development/paper-gtk-theme"
fi

if [ ! -f /home/${SUDO_USER}/Development/paper-icon-theme/install.sh ]; then
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

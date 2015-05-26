wget http://de.download.nvidia.com/XFree86/Linux-x86_64/346.72/NVIDIA-Linux-x86_64-346.72.run
dracut --omit-drivers nouveau /boot/initramfs-$(uname -r).img $(uname -r) --force
systemctl disable gdm
sudo reboot

sudo bash NVIDIA-Linux-x86_64-346.72.run
systemctl enable gdm
sudo reboot

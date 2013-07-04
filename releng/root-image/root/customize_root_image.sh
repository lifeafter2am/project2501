#!/bin/bash
# Configure live iso
set -e -u -x
shopt -s extglob

# Set locales
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

# Sudo to allow no password
sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers
chown -c root:root /etc/sudoers
chmod -c 0440 /etc/sudoers

# Set timezone
ln -sf /usr/share/zoneinfo/America/Montreal /etc/localtime

# Set clock
hwclock --systohc --utc

# Add live user
useradd -m -p "" -g users -G "adm,storage,optical,audio,video,network,wheel,power,lp,log" -s /bin/zsh pptmstr
chown pptmstr /home/pptmstr

# Change all users to use zsh
usermod -s /bin/zsh root

# Clean /etc/skel
rm -rf /etc/skel

systemctl enable multi-user.target pacman-init.service

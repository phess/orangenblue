#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 remove -y nano-default-editor
dnf5 install -y \
   at \
   btop \
   distrobox \
   duperemove \
   firefox \
   git \
   gnome-shell-extension-user-theme \
   gnome-tweaks \
   iptraf-ng \
   krb5-workstation \
   libvirt-daemon \
   libvirt-daemon-driver-network \
   libvirt-daemon-driver-nodedev \
   libvirt-daemon-driver-qemu \
   libvirt-daemon-driver-storage \
   nmap \
   openssl \
   pam-u2f \
   pamu2fcfg \
   qemu-kvm \
   ramalama \
   ripgrep \
   solaar \
   strace \
   sysstat \
   systemd-container \
   tailscale \
   tcpdump \
   tmux \
   v4l-utils \
   yaru-theme \
   vim \
   vim-default-editor

dnf5 install -y https://prerelease.keybase.io/keybase_amd64.rpm
dnf5 install -y keybase

## TODO: Figure out how to install RPMs from a repo that is only available inside my intranet.


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable tailscaled

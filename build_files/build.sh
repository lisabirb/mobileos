#!/bin/bash

set -ouex pipefail

curl -fsSL https://repo.librewolf.net/librewolf.repo > /etc/yum.repos.d/librewolf.repo

PKG_GROUPS=(
kde-mobile
kde-mobile-apps
)

COPR_REPOS=(
ublue-os/packages
secureblue/bubblejail
)

PACKAGES=(
librewolf
ublue-brew
neovim
bubblejail
fish
)

for i in ${PKG_GROUPS[@]}; do
  dnf -y group install $i
done

for i in ${COPR_REPOS[@]}; do
  dnf -y copr enable $i
done

dnf5 -y install ${PACKAGES[@]}

systemctl enable podman.socket

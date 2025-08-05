#!/bin/bash

set -ouex pipefail

curl -fsSL https://repo.librewolf.net/librewolf.repo > /etc/yum.repos.d/librewolf.repo

GROUPS=(
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

for i in ${COPR_REPOS[@]}; do
  dnf -y copr enable $i
done

dnf5 -y install ${PACKAGES[@]}

for i in ${GROUPS[@]}; do
  dnf -y group install $i
done

systemctl enable podman.socket

#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be executed as root."
  exit 1
fi

if [[ $(readlink -f "$0") != *wet*install.sh ]]; then
  git clone https://github.com/toxikuu/wet && cd wet
fi

mkdir -pv /tbin
cp -iv ./wetenv /etc/
cp -iv ./wet /tbin/

if [[ -e /tbin/wet && -e /etc/wetenv ]]; then
  echo "Wet has been successfully installed."
else
  echo "Installation failed! The fuck you do?" && exit 1
fi

echo "pathappend /tbin" >> /etc/profile
echo "Run . /etc/profile"

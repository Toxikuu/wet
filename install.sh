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

# I don't think the below command works. I'll fix later.
pathappend /tbin || echo "Function: 'pathappend' not defined!"

if [[ -e /tbin/wet && -e /etc/wetenv ]]; then
  echo "Wet has been successfully installed."
fi

if [ "$PATH" == *tbin* ]; then
  echo "/tbin has been successfully added to PATH"
fi

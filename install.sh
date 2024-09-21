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

pathappend /tbin || echo "Function: 'pathappend' not defined!"

#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "This script must be executed as root."
  exit 1
fi

if [[ $(readlink -f "$0") != *wet*install.sh ]]; then
  git clone https://github.com/toxikuu/wet && pushd wet
fi

mkdir -pv /tbin
cp -v ./wetenv /etc/
cp -v ./wet /tbin/

if [[ -e /tbin/wet && -e /etc/wetenv ]]; then
  echo -e "\n\x1b[1;3mWet has been successfully installed.\x1b[0m\n"
else
  echo -e "\x1b[31;1;3mInstallation failed! The fuck you do?\x1b[0m" && exit 1
fi

echo "pathappend /tbin" >> /etc/profile
echo -e "\x1b[1;3mYou should execute the following command now:\x1b[0m" 
echo ". /etc/profile"

popd
rm -rvf wet

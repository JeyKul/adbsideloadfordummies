#!/bin/bash

echo -e "\033[0;32mChecking for dependencies"

if [[ $(which wget) ]]; then
   true
   DOWNLOAD=wget
elif [[ $(which curl) ]]; then
   true
   DOWNLOAD=curl
else
   echo -e "\033[0;31mNeither curl nor wget are installed"
   exit 0
fi

if [[ $(which unzip) ]]; then
   true
else
   echo -e "\033[0;31munzip is not installed"
   exit 0
fi

URL="https://dl.google.com/android/repository/platform-tools-latest-linux.zip"
mkdir ~/tmpp
cd ~/tmpp

if [[ "$DOWNLOAD" == "wget" ]]; then
   $DOWNLOAD $URL
else
   $DOWNLOAD -O $URL
fi

unzip platform-tools-latest-linux.zip
cp -r platform-tools /usr/lib
ln -s /usr/lib/platform-tools/adb /usr/bin
rm -rf ~/tmpp
echo -e "\033[0;32mInstallation was successful"

#!/bin/bash

echo checking some things

if [[ $(which wget) ]]; then
true
DOWNLOAD=wget
elif [[ $(which curl) ]]; then
true
DOWNLOAD=curl
else
echo "wget is not installed"
exit 0
fi

if [[ $(which unzip) ]]; then
true
else 
echo "unzip is not installed"
exit 0
fi

mkdir ~/tmpp 
cd ~/tmpp
$DOWNLOAD https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip
cp -r platform-tools /usr/lib
ln /usr/lib/platform-tools/adb /usr/bin
rm -rf ~/tmpp

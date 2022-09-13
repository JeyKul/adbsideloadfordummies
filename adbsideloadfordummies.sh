mkdir ~/tmpp 
cd ~/tmpp
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip
cp -r platform-tools /usr/lib
ln /usr/lib/platform-tools/adb /usr/bin
rm -rf ~/tmpp

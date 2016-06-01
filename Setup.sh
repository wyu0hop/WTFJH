#!/usr/bin/env bash
echo "Installing Latest Dependencies"
brew install dpkg
brew install ldid
brew install wget
brew install homebrew/dupes/unzip
echo "Pulling Latest Trunk"
git submodule foreach git pull origin master
sudo pip install colorama
echo "Building capstone"
cd capstone && ./make.sh ios  && cd ../
echo "Moving capstone"
mv ./capstone/libcapstone.a ./
echo "Downloading Cycript"
wget https://cydia.saurik.com/api/latest/3 -O Cycript.zip
echo "Cleaning old framework"
rm -rf ./Cycript.framework
echo "Extracting Cycript"
mkdir CYTMP
unzip Cycript.zip -d ./CYTMP
cp -avR ./CYTMP/Cycript.ios/*.framework ./ 
rm -rf ./CYTMP
rm -rf ./Cycript.zip
echo "Downloading Reveal"
wget http://download.revealapp.com/Reveal.app.zip
unzip Reveal.app.zip -d ./RevealTMP
cp -rf ./RevealTMP/Reveal.app/Contents/SharedSupport/iOS-Libraries/Reveal.framework ./
rm -rf ./RevealTMP
rm -rf ./Reveal.app.zip




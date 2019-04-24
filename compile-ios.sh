#!/bin/bash
swiftc -target arm64-apple-ios11.4 -v -sdk $(xcrun --show-sdk-path --sdk iphoneos) *.swift -o trolldrop
install_name_tool -add_rpath /usr/lib/libswift/4.1.2 trolldrop
ldid2 -S./ent.xml trolldrop
mkdir deb
mkdir deb/usr
mkdir deb/usr/bin
mkdir deb/DEBIAN
cp control deb/DEBIAN
cp -R trolldrop deb/usr/bin/
dpkg-deb -b deb trolldrop12.deb 
rm -rf deb 
rm trolldrop




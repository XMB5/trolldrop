#!/bin/bash

if [ -z "$CSID" ]; then
    echo "put your code signing identity in the CSID environment variable"
    exit 1
fi

swiftc -target arm64-apple-ios11.4 -v -sdk $(xcrun --show-sdk-path --sdk iphoneos) *.swift -o trolldrop-ios
codesign -s "$CSID" -fv --entitlements ent.xml trolldrop-ios

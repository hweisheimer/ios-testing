#!/bin/bash

rm DVIA-v2-*.ipa

# make a copy for windows
cp DVIA-v2.ipa DVIA-v2-windows.ipa

pushd frida-configs-mac
zip -r ../DVIA-v2.ipa Payload
popd

pushd frida-configs-windows
zip -r ../DVIA-v2-windows.ipa Payload
popd

objection patchipa -s DVIA-v2.ipa -c ABC123  -V 12.8.5 -P 20200104_All_The_Things.mobileprovision
objection patchipa -s DVIA-v2-windows.ipa -c ABC123 -V 12.8.5 -P 20200104_All_The_Things.mobileprovision

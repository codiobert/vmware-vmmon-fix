#!/bin/bash

MOK_PRIV=vmware-mok.priv
MOK_DER=vmware-mok.der

if [ "$EUID" -ne 0 ]
    then echo "Please run this script as root"
    exit
fi

echo
echo "Generate and sign $MOK_PRIV and $MOK_DER files"
openssl req -new -x509 -newkey rsa:2048 -keyout ~/$MOK_PRIV -outform DER -out ~/$MOK_DER -nodes -days 36500 -subj "/CN=VMware/"
/usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmmon)
/usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmnet)

echo
echo "Please set a password (BIOS will ask you for this password when the computer is rebooted to apply the key)"
mokutil --import ~/$MOK_DER

echo
echo "### IMPORTANT: Reboot your computer and follow BIOS instructions to finish the installation ###"
echo

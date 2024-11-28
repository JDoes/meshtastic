#!/bin/bash

USBDEVICE=$(ls /dev/ | grep -i usb)
USBTTY=$(ls /dev/ | grep -i tty.usb)
USBCU=$(ls /dev/ | grep -i cu.usb)

echo -e "\nThe easiest way to view the console is simply:\n\tmeshtastic --noproto\n"

echo -e "This next method is specific to Mac OS\n\thttps://jasonmurray.org/posts/2020/serialconsolemacos/\n"

echo -e "Your computer's USB devices are probably:\n${USBDEVICE}\n"

echo -e "The command to commect to the console is:\nsudo cu -s 115200 -l ${USBTTY}\n"

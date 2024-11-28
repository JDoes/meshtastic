#!/bin/bash

#----------------------------------

#Radio > Bluetooth
TITLE='Bluetooth Enabled'

items=(1 "CLIEN"
       2 "CLIENT_MUTE"
       3 "Show node info")

while choice=$(dialog --title "$TITLE" \
                 --menu "Bluetooth docs: https://meshtastic.org/docs/configuration/radio/bluetooth/" 15 80 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do  
    case $choice in
        1) meshtastic --set device.role CLIENT --reboot ;;
        2) meshtastic --set device.role CLIENT_MUTE --reboot ;;
        3) meshtastic --info ;;
        *) echo "Ooooops, invalid option" ;;
    esac
done
clear # clear after user pressed Cancel

#----------------------------------

TITLE='Bluetooth Mode'

items=(1 "CLIEN"
       2 "CLIENT_MUTE"
       3 "Show node info")

while choice=$(dialog --title "$TITLE" \
                 --menu "Bluetooth docs: https://meshtastic.org/docs/configuration/radio/bluetooth/" 15 80 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case $choice in
        1) meshtastic --set device.role CLIENT --reboot ;;
        2) meshtastic --set device.role CLIENT_MUTE --reboot ;;
        3) meshtastic --info ;;
        *) echo "Ooooops, invalid option" ;;
    esac
done
clear # clear after user pressed Cancel

#----------------------------------

TITLE='Bluetooth PIN (if manual)'

items=(1 "CLIEN"
       2 "CLIENT_MUTE"
       3 "Show node info")

while choice=$(dialog --title "$TITLE" \
                 --menu "Bluetooth docs: https://meshtastic.org/docs/configuration/radio/bluetooth/" 15 80 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case $choice in
        1) meshtastic --set device.role CLIENT --reboot ;;
        2) meshtastic --set device.role CLIENT_MUTE --reboot ;;
        3) meshtastic --info ;;
        *) echo "Ooooops, invalid option" ;;
    esac
done
clear # clear after user pressed Cancel


#################################################
#################################################


#Radio > Channels

#Radio > Device
TITLE='Choose between Device Roles:'

items=(1 "CLIENT"
       2 "CLIENT_MUTE"
       3 "Show node info")

while choice=$(dialog --title "$TITLE" \
                 --menu "Device Roles: https://meshtastic.org/docs/configuration/radio/device/" 15 80 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case $choice in
        1) meshtastic --set device.role CLIENT --reboot ;;
        2) meshtastic --set device.role CLIENT_MUTE --reboot ;;
        3) meshtastic --info ;;
        *) echo "Ooooops, invalid option" ;;
    esac
done
clear # clear after user pressed Cancel



#################################################
#################################################


#Radio > Display



#Radio > LoRa



#Radio > Network



#Radio > Network




#Radio > Position




#Radio > Power



#Radio > Security



#Radio > User

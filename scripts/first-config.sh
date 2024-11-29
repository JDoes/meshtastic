#!/bin/bash

DIVIDER="~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

clear

echo -e "\nThis is modeled after:\nhttps://meshtastic.org/docs/configuration/\nIf there are any conflicts between this script and the official Meshtastic documentation, always defer to the official docs. The main focus of this script is to do two basic configurations:\n\t1) LoRa Region\n\t2) Bluetooth Setup\n*** RADIO CONFIG docs: https://meshtastic.org/docs/configuration/radio/\n"


#-----------------------
#BLUETOOTH:
#____

	echo -e "\n${DIVIDER}\n\nBLUETOOTH:\thttps://meshtastic.org/docs/configuration/radio/bluetooth/\n"

#-bluetooth.enabled: true, false
	echo -e "\nChoose a setting for bluetooth.enabled:"
	echo -e "T) true\nF) false\nQ) QUIT"
	read -n1 -p ": " Choice
	echo

	case $Choice in
		t | T) echo -e "\n\t\tYou chose to enable Bluetooth"; export BTenabled=true ;;
		f | F) echo -e "\n\t\tYou chose to disable Bluetooth"; export BTenabled=false ;;
		q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; break ;;
		*) echo "ERROR: Please choose T, F, or Q." ;;
	esac

#-bluetooth.mode: RANDOM_PIN, FIXED_PIN, NO_PIN
#-bluetooth.fixed_pin: integer (6 digits)
        echo -e "\nChoose a setting for bluetooth.mode:"
        echo -e "R) RANDOM_PIN\nF) FIXED_PIN\nN) NO_PIN\nQ) QUIT"
        read -n1 -p ": " Choice
        echo

        case $Choice in
                r | R) echo -e "\n\t\tYou chose to have a random PIN"; export BTmode=RANDOM_PIN ;;
                f | F) echo -e "\n\t\tYou chose to have a fixed PIN"; export BTmode=FIXED_PIN ;;
                n | N) echo -e "\n\t\tYou chose to have no PIN."; export BTmode=NO_PIN ;;
		q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; break ;;
                *) echo "ERROR: Please choose R, F, N, or Q." ;;
        esac

	if [[ ${BTmode} == "FIXED_PIN" ]]
	then
		echo -e ""
		read -p "Since you chose FIXED_PIN, enter a 6-digit BT PIN: " PIN_VALUE
		echo -e "\n\t\tBT Enabled will be set to ${BTenabled}\n\t\tBT Mode will be set to ${BTmode}\n\t\tThe BT PIN will be set to ${PIN_VALUE}"
		meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --set bluetooth.fixed_pin ${PIN_VALUE}--commit-edit
	else
		echo -e "\n\t\tBT Enabled will be set to ${BTenabled}\n\t\tBT mode will be set to ${BTmode}"
		meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --commit-edit
	fi
	
	unset BTmode
	unset BTenabled
	unset PIN_VALUE

#-----------------------
echo -e "\n${DIVIDER}\n\nCHANNELS:\thttps://meshtastic.org/docs/configuration/radio/channels/"

#-----------------------
echo -e "DEVICE:\t\thttps://meshtastic.org/docs/configuration/radio/device/"

#-----------------------
echo -e "DISPLAY:\thttps://meshtastic.org/docs/configuration/radio/display/"

#-----------------------
#LORA:
#____

	echo -e "\n${DIVIDER}\n\nLORA:\t\thttps://meshtastic.org/docs/configuration/radio/lora/"

#-lora.use_preset: false, true

#-lora.region: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923
        echo -e "\nGeographioc regions include: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923" 
	read -p "Enter the region: " REGION
        
	echo -e "\n\t\tThe LoRa region will be set to ${REGION}"
	meshtastic --set lora.region ${REGION}

#-lora.tx_enabled: false, true

        unset REGION

#-----------------------
echo -e "\n${DIVIDER}\n\nNETWORK:\thttps://meshtastic.org/docs/configuration/radio/network/"


#-----------------------
echo -e "POSITION:\thttps://meshtastic.org/docs/configuration/radio/position/"


#-----------------------
echo -e "POWER:\t\thttps://meshtastic.org/docs/configuration/radio/power/"


#-----------------------
echo -e "SECURITY:\thttps://meshtastic.org/docs/configuration/radio/security/"


#-----------------------
echo -e "USER:\t\thttps://meshtastic.org/docs/configuration/radio/user/"


echo -e "\n${DIVIDER}\n\nThis concludes the first-time setup.\n/Users/billy/meshtastic-work/github/meshtastic/scripts/extensive-config.sh\n\n\t\tGoodBye!\n"

#!/bin/bash

clear

echo -e "\nThis is modeled after:\nhttps://meshtastic.org/docs/configuration/\nIf there are any uncertainties or conflicts between this script and the official Meshtastic documentation, always defer to the official docs. The main focus of this script is to do the Radi Configuration specifically. However, there are some Module Config settings in here, too.\n\n\t*** RADIO CONFIG docs: https://meshtastic.org/docs/configuration/radio/\n\t*** MODULE CONFIG docs: https://meshtastic.org/docs/configuration/radio/"


#-----------------------
#BLUETOOTH:
#____

	echo -e "\nBLUETOOTH: https://meshtastic.org/docs/configuration/radio/bluetooth/\n"

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
                f | F) echo -e "\n\t\tYou chose to have a fixed pin (needs work)"; export BTmode=FIXED_PIN ;;
                n | N) echo -e "\n\t\tYou chose to have no pin."; export BTmode=NO_PIN ;;
		q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; break ;;
                *) echo "ERROR: Please choose R, F, N, or Q." ;;
        esac

	if [[ ${BTmode} == "FIXED_PIN" ]]
	then
		read -p "Since you chose FIXED_PIN, enter a 6-digit BT PIN: " PIN_VALUE
		echo -e "BT Enabled will be set to ${BTenabled} and BT mode will be set to ${BTmode}, and the BT pin will be set to ${PIN_VALUE}"
		#meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --set bluetooth.fixed_pin ${PIN_VALUE}--commit-edit
	else
		echo -e "BT Enabled will be set to ${BTenabled} and BT mode will be set to ${BTmode}"
		#meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --commit-edit
	fi
	
	unset BTmode
	unset BTenabled
	unset PIN_VALUE


#-----------------------
echo -e "\nCHANNELS: https://meshtastic.org/docs/configuration/radio/channels/\n"


#-----------------------
echo -e "\nDEVICE: https://meshtastic.org/docs/configuration/radio/device/\n"


#-----------------------
echo -e "\nDISPLAY: https://meshtastic.org/docs/configuration/radio/display/\n"


#-----------------------
#LORA:
#____

	echo -e "\nLORA: https://meshtastic.org/docs/configuration/radio/lora/"

#-lora.use_preset: false, true

#-lora.region: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923
        read -p "Geographioc regions include: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923. Enter the region: " REGION
        echo -e "The LoRa region will be set to ${REGION}"
	
	#meshtastic --set lora.region ${REGION}

#-lora.tx_enabled: false, true

        unset REGION

#-----------------------
echo -e "\nNETWORK: https://meshtastic.org/docs/configuration/radio/network/\n"


#-----------------------
echo -e "\nPOSITION: https://meshtastic.org/docs/configuration/radio/position/\n"


#-----------------------
echo -e "\nPOWER: https://meshtastic.org/docs/configuration/radio/power/\n"


#-----------------------
echo -e "\nSECURITY: https://meshtastic.org/docs/configuration/radio/security/\n"


#-----------------------
echo -e "\nUSER: https://meshtastic.org/docs/configuration/radio/user/\n"


echo -e "\nGoodBye!\n"

#!/bin/bash

###################################
#####                         #####
#####   Vars and Funct'ns     #####
#####                         #####
###################################

DIVIDER="~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


#Function is not working properly, I am inexperienced in functions.

REBOOT_MSG="\n\n########################\n### Device rebooting ###\n########################\n\n\tWatch the screen or console.\n\tOr just wait until the node starts responding to --get lora.region or some other arbitrary command.\n\n"


###################################
#####                         #####
#####     Script begins       #####
#####                         #####
###################################


clear

echo -e "\nThis is modeled after:\nhttps://meshtastic.org/docs/configuration/\nIf there are any conflicts between this script and the official Meshtastic documentation, always defer to the official docs. The main focus of this script is to do two basic configurations:\n\t1) LoRa Region\n\t2) Bluetooth Setup\n*** RADIO CONFIG docs: https://meshtastic.org/docs/configuration/radio/\n"

#########################
#-----------------------
#BLUETOOTH:
#____
####
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
		echo -e "\n\t\tBT Enabled will be set to ${BTenabled}\n\t\tBT Mode will be set to ${BTmode}\n\t\tThe BT PIN will be set to ${PIN_VALUE}\n\n"
		meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --set bluetooth.fixed_pin ${PIN_VALUE} --commit-edit --reboot
	else
		echo -e "\n\t\tBT Enabled will be set to ${BTenabled}\n\t\tBT mode will be set to ${BTmode}\n\n"
		meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --commit-edit --reboot
	fi
	

	unset BTmode
	unset BTenabled
	unset PIN_VALUE

#########################
#-----------------------
#____
####
echo -e "\n${DIVIDER}\n\nCHANNELS:\thttps://meshtastic.org/docs/configuration/radio/channels/"

#########################
#-----------------------
#____
####
echo -e "DEVICE:\t\thttps://meshtastic.org/docs/configuration/radio/device/"

#########################
#-----------------------
#____
####
echo -e "DISPLAY:\thttps://meshtastic.org/docs/configuration/radio/display/"


#rebootMessage()
echo -e ${REBOOT_MSG}
sleep 10

#########################
#-----------------------
#LORA:
#____
####

	echo -e "\n${DIVIDER}\n\nLORA:\t\thttps://meshtastic.org/docs/configuration/radio/lora/"

#-lora.use_preset: false, true

#-lora.region: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923
        echo -e "\nGeographioc regions include: UNSET, US, EU_433, EU_868, CN, JP, ANZ, KR, TW, RU ,IN, NZ_865, TH, LORA_24, UA_433, UA_868, MY_433, MY_919, SG_923" 
	read -p "Enter the region: " REGION
        
	echo -e "\n\t\tThe LoRa region will be set to ${REGION}\n\n"
	meshtastic --begin-edit --set lora.region ${REGION} --commit-edit --reboot


#-lora.bandwidth: 31, 62, 125, 250, 500
#-lora.spread_factor: 7, 8, 9, 10, 11, 12
#-lora.coding_rate: 5, 6, 7, 8
#-lora.frequency_offset: 0 to 1000000
#-lora.hop_limit: 1,2,3,4,5,6,7
#-lora.tx_power: 0 to 30
#-lora.tx_enabled: false, true
#-lora.channel_num: 0, 1 to NUM_CHANNELS
#-lora.ignore_mqtt: false, true
#-lora.config_ok_to_mqtt: false, true
#-lora.override_duty_cycle: false, true
#-lora.sx126x_rx_boosted_gain: false, true
#-lora.override_frequency: Any supported frequency the LoRA radio is capable of. Please respect local rules and regulations

        unset REGION


#########################
#-----------------------
#____
####
echo -e "\n${DIVIDER}\n\nNETWORK:\thttps://meshtastic.org/docs/configuration/radio/network/"

#########################
#-----------------------
#____
####
echo -e "POSITION:\thttps://meshtastic.org/docs/configuration/radio/position/"

#########################
#-----------------------
#____
####
echo -e "POWER:\t\thttps://meshtastic.org/docs/configuration/radio/power/"

#########################
#-----------------------
#____
####
echo -e "SECURITY:\thttps://meshtastic.org/docs/configuration/radio/security/"

#########################
#-----------------------
#____
####
echo -e "USER:\t\thttps://meshtastic.org/docs/configuration/radio/user/"

#rebootMessage()
echo -e ${REBOOT_MSG}
sleep 10

###################################
#####                         #####
#####   Last Final Review     #####
#####                         #####
###################################

echo -e "\n${DIVIDER}\n${DIVIDER}\n\n\t\tSANITY CHECK:\n"

echo -e "Double check the settings below once more:"

echo -e "\n\n$(meshtastic --info | grep -A4 -iw '"bluetooth": {')\n"
echo -e "\n\n$(meshtastic --info | grep -A18 -w '"lora": {')\n"

echo -e "\n${DIVIDER}\n\nThis concludes the first-time setup."
echo -e "For a more in-depth configuration, always refer to the official docs: https://meshtastic.org/docs/"
echo -e "\nAdditionally, here is a helper script to do more advanced configs: https://github.com/JDoes/meshtastic/blob/main/scripts/extensive-config.sh"

echo -e "\n\n\t\tGoodBye!\n"



###################################
#####                         #####
#####	Scratch Work Area     #####
#####                         #####
###################################


#-bluetooth.enabled
#        echo -e "\nChoose a setting for bluetooth.enabled:"
#        echo -e "T) true\nF) false\nQ) QUIT"
#        read -n1 -p ": " Choice
#        echo
#
#        case $Choice in
#                t | T) echo -e "\n\t\tYou chose to enable Bluetooth"; export BTenabled=true ;;
#                f | F) echo -e "\n\t\tYou chose to disable Bluetooth"; export BTenabled=false ;;
#                q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; break ;;
#                *) echo "ERROR: Please choose T, F, or Q." ;;
#        esac
#
#	if [[ ${BTmode} == "FIXED_PIN" ]]
#        then
#                read -p "Since you chose FIXED_PIN, enter a 6-digit BT PIN: " PIN_VALUE
#                echo -e "BT Enabled will be set to ${BTenabled} and BT mode will be set to ${BTmode}, and the BT pin will be set to ${PIN_VALUE}"
#                #meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --set bluetooth.fixed_pin ${PIN_VALUE}--commit-edit
#        else
#                echo -e "BT Enabled will be set to ${BTenabled} and BT mode will be set to ${BTmode}"
#                #meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --commit-edit
#        fi
#
#        unset BTmode
#        unset BTenabled
#        unset PIN_VALUE
#








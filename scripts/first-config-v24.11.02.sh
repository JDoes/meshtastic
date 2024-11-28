#!/bin/bash

clear

echo -e "\nThis is modeled after:\nhttps://meshtastic.org/docs/configuration/\nIf there are any uncertainties or conflicts between this script and the official Meshtastic documentation, always defer to the official docs. The main focus of this script is to do the Radi Configuration specifically. However, there are some Module Config settings in here, too.\n\n\t*** RADIO CONFIG docs: https://meshtastic.org/docs/configuration/radio/\n\t*** MODULE CONFIG docs: https://meshtastic.org/docs/configuration/radio/"

#while :
#do

#__________________________
#BLUETOOTH:
	echo -e "\nBLUETOOTH: https://meshtastic.org/docs/configuration/radio/bluetooth/\nPlease choose an option:"

#-bluetooth.enabled
	echo -e "\nChoose a setting for bluetooth.enabled:"
	echo -e "T) true\nF) false\nQ) QUIT"
	read -n1 -p ": " Choice
	echo

	case $Choice in
		t | T) echo -e "\n\t\tYou chose to enable Bluetooth"; export BTenable=true ;;
		f | F) echo -e "\n\t\tYou chose to disable Bluetooth"; export BTenable=false ;;
		q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; export BTenable=''; break ;;
		*) echo "ERROR: Please choose T, F, or Q." ;;
	esac

#-bluetooth.mode
        echo -e "\nChoose a setting for bluetooth.mode:"
        echo -e "R) RANDOM_PIN\nF) FIXED_PIN - this feature needs work, you'll have to set your own PIN for now, sorry\nN) NO_PIN\nQ) QUIT"
        read -n1 -p ": " Choice
        echo

        case $Choice in
                r | R) echo -e "\n\t\tYou chose to have a random PIN"; export BTmode=RANDOM_PIN ;;
                f | F) echo -e "\n\t\tYou chose to have a fixed pin (needs work)"; export BTmode=FIXED_PIN ;;
                n | N) echo -e "\n\t\tYou chose to have no pin."; export BTmode=NO_PIN ;;
		q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; export BTmode=''; break ;;
                *) echo "ERROR: Please choose R, F, N, or Q." ;;
        esac

#-bluetooth.fixed_pin
###########################
### COME BACK TO THIS #####
###########################

#	meshtastic --begin-edit --set bluetooth.enabled ${BTenabled} --set bluetooth.mode ${BTmode} --commit-edit

#__________________________
#LORA:
#        echo -e "\nPlease choose an option:"
#        echo -e "A) Apples\nB) Beets\nC) Carrots\nZ) QUIT"
#        read -n1 -p ": " Choice
#        echo
#        
#        case $Choice in
#                a | A) echo -e "\n\t\tYou picked Apples."; export CMDOPT=Apples ;;
#                b | B) echo -e "\n\t\tYou picked Beets."; export CMDOPT=Beets ;; 
#                c | C) echo -e "\n\t\tYou picked Carrots." export CMDOPT=Carrots ;;
#                q | Q) echo -e "\n\t\t#*#*#* - QUITTING - *#*#*# "; break ;;
#                *) echo "ERROR: Please choose A, B, C or Z." ;;
#        esac
#         
#        echo "${CMDOPT} are good, what a good choice."

#done

echo -e "\nGoodBye!\n"

#!/bin/bash

meshtastic --export-config > final-config_$(date "+%Y-%m-%d_%H-%M-%S").yaml

sleep 5

meshtastic --info > info-out_$(date "+%Y-%m-%d_%H-%M-%S").yaml

sleep 5

meshtastic --nodes > nodes-out-table_$(date "+%Y-%m-%d_%H-%M-%S").txt

echo -e "\nYour outputs were saved in the directory: $(pwd)/ , as the files:\n$(ls -tr | tail -3)"
echo -e "\nFor more info on backing up and restoring configurations, see the opfficial documentation:\n\thttps://meshtastic.org/docs/software/python/cli/\n\n"

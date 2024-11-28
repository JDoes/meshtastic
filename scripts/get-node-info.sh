#!/bin/bash

meshtastic --export-config > final-config_$(date "+%Y-%m-%d_%H-%M-%S").yaml

sleep 5

meshtastic --info > info-out_$(date "+%Y-%m-%d_%H-%M-%S").yaml

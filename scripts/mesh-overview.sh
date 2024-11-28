#!/bin/bash

using USB serial connection, on a Mac

meshtastic --nodes

	#eventually make this a function, and replace the function in one place. The function will wait for some indication that the node has rebooted and is ready for the next configuration change.
sleep 10

	#need to designate and distinguish between nodes here
meshtastic --get lora


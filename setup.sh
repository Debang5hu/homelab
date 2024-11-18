#!/usr/bin/bash

echo -e "[+] Building the image!"

sudo docker build -t homelab .  

clear

echo -e "[+] Image building done!"

echo -e "[+] Launching"

sleep 3

clear

sudo docker run -it --network host homelab
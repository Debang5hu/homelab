#!/usr/bin/bash

sudo docker build -t homelab .

sudo docker run -it --network host homelab
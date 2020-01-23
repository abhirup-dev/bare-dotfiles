#!/bin/bash
LOCATION_DIR=$1
# sudo tcpdump -G 120 -i enp0s3 -w $LOCATION_DIR/$(date +"%H-%M--%d-%m-%y").pcap
sudo tcpdump -C 10 -i enp0s3 -v -w $LOCATION_DIR/$(date +"%H-%M--%d-%m-%y").pcap

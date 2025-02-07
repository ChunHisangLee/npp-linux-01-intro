#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

set -euxo pipefail

sudo ip link add name br0 type bridge 2>/dev/null || true

sudo ip link set dev br0 up

for intf in $(ip -o link show | grep 'clab-lab1-part1-host' | awk -F': ' '{print $2}'); do
    sudo ip link set dev "$intf" master br0
    sudo ip link set dev "$intf" up
done

echo "Bridge setup complete."

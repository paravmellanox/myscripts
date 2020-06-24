#!/bin/bash
# This script is aimed to calculate and compare the time taken 
# to change the link of the VF representors.

# argument 1 is command (dev/carrier).
# argument 2 is VF representor device name (such as ens1f0pf0vf0).

COUNT=255
DEV=$2
function dev_up_down() {
        echo "dev up/down"
        for (( c=1; c<=$COUNT; c++ ))
        do
                ip link set $DEV up
                ip link set $DEV down
        done
}

function carrier_up_down() {
        echo "carrier up/down"
        for (( c=1; c<=$COUNT; c++ ))
        do
                ip link set $DEV carrier on
                ip link set $DEV carrier off
        done
}

case $1 in
        dev)
                dev_up_down
                ;;

        carrier)
                carrier_up_down
                ;;
        *)
                ;;
esac

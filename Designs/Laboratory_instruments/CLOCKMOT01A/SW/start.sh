#!/bin/bash
cd /home/odroid/repos/CLOCKMOT01A/

if ! pidof -x ./CLOCKMOT.py > /dev/null; then
    ./CLOCKMOT.py 125 &
fi
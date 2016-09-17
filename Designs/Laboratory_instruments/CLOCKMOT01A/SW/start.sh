#!/bin/bash
cd /home/odroid/repos/CLOCKMOT01A/

if ! pidof -x ./CLOCKMOT.py > /dev/null; then
    ./CLOCKMOT.py 52.36 &
fi
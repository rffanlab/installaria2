#!/bin/bash

ping -c1 -w1 -t5 192.168.0.125>/dev/null 2>&1 && echo ok|| sudo reboot
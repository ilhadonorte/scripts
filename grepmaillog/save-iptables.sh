#!/bin/bash
iptables-save > $(date +%Y-%m-%d)-sumare-iptables.txt


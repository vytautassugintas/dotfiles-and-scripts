#!/bin/bash
# store $VPN pwd somewhere in env vars
# store VPNName somewhere in env vars - match the name of the VPN service to run

function isnt_connected () {
    scutil --nc status "$VPNName" | sed -n 1p | grep -qv Connected
}

echo "Using VPN service: $VPNName"

if isnt_connected $VPNName; then
    echo "Connecting to VPN..."
    echo $VPN | tr -d '\n' | pbcopy # copy password to clipboard
    scutil --nc start "$VPNName" # show vpn connection prompt
else
    echo "Already Connected to VPN..."
fi


#!/bin/bash
# store $VPN pwd somewhere in env vars
# store VPNName somewhere in env vars - match the name of the VPN service to run

function isnt_connected () {
    scutil --nc status "$VPNName" | sed -n 1p | grep -qv Connected
}

echo "Disconnecting from VPN service: $VPNName"

if isnt_connected $VPNName; then
    echo "Already disconnected!"
else
    scutil --nc stop "$VPNName"
    echo "Done!"
fi


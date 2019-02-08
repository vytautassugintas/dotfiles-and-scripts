keychainItem="" # this name has to match "Account" for the entry you make in keychain
VPNName=""  # match the name of the VPN service to run

function isnt_connected () {
    scutil --nc status "$VPNName" | sed -n 1p | grep -qv Connected
}

get_pw () {
   security 2>&1 >/dev/null find-generic-password -ga $keychainItem \
   |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/'
}

echo "fetching VPN credentials from keychain account \"$keychainItem\""
echo "Using VPN service: $VPNName"

if isnt_connected $VPNName; then
    echo "Connecting to VPN..."
    scutil --nc start "$VPNName"
    sleep 0.5
    osascript -e "tell application \"System Events\" to keystroke \"$(get_pw)\""
    osascript -e "tell application \"System Events\" to keystroke return"
    sleep 2
    osascript -e "tell application \"System Events\" to keystroke return"
else
    echo "Already Connected to VPN..."
fi


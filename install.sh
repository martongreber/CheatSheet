cp ./XPCservice/com.murculus.cheatsheet.xpc.plist /Users/martongreber/Library/LaunchAgents/
plist="/Users/martongreber/Library/LaunchAgents/com.murculus.cheatsheet.xpc.plist"
launchctl unload -w $plist
launchctl load -w $plist
launchctl list | grep murculus
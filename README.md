# Xcode cheat.sh client

A simple project which aims to bring XCode support for the popular CheatSheet project: https://cheat.sh/ .

## Developer notes

* XPCService is the servic running in the background
* Extension is the XCode extension, which communicates with the service
* To properly launch the service, the service's .plist file has to be copied into /Users/\<user\>/Library/LaunchAgents/
    * Then load etc.
    * This is done in the install.sh script

## References
- https://rderik.com/blog/creating-a-launch-agent-that-provides-an-xpc-service-on-macos/
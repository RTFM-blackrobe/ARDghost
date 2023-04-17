#!/bin/bash

# Disable remote login
sudo systemsetup -setremotelogin off

# Disable screen sharing
sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool 
true

# Disable file sharing
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# Disable remote management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
sudo defaults write /Library/Preferences/com.apple.RemoteManagement.plist ARD_AllLocalUsers -bool false
sudo defaults write /Library/Preferences/com.apple.RemoteManagement.plist DisabledRemoteDesktop -bool true
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteUI.plist



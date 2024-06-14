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
# Block SSH
sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist

# Block FTP
sudo launchctl unload -w /System/Library/LaunchDaemons/ftp.plist

# Block Telnet
sudo launchctl unload -w /System/Library/LaunchDaemons/telnet.plist

# Block TFTP
sudo launchctl unload -w /System/Library/LaunchDaemons/tftp.plist

# Block NetBIOS
sudo launchctl unload -w /System/Library/LaunchDaemons/netbios.plist

# Block NPC (NetBIOS Name Service)
sudo launchctl unload -w /System/Library/LaunchDaemons/nmbd.plist

sudo launchctl unload -w /System/Library/LaunchDaemons/org.cups.cupsd.plist

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.remotepairtool.plist

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ppd.plist

defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist


#block all incoming traffic aplication layer firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 2

#port 22 block
sudo pfctl -t blocklist -T add 0.0.0.0/0 port 22
#_____

#Disable Bonjour:
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist

#Disable Remote Pairing Tool:
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.remotepairtool.plist

#Disable Printer Sharing:
sudo launchctl unload -w /System/Library/LaunchDaemons/org.cups.cupsd.plist

#Disable NetBIOS and NPC (NetBIOS Name Service):

sudo launchctl unload -w /System/Library/LaunchDaemons/netbios.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/nmbd.plist

#Block all incoming traffic at the application layer firewall:

sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 2

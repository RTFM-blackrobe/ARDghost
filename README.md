# ARDghost
![B3_23_Logos_016-1-2](https://user-images.githubusercontent.com/118631549/232637150-b767436a-5df1-49a3-b200-eff8d29272e6.png)

ARDghost - RTFM

If you need to block people from streaming your screen 
and stealing your information
use this script:

in your terminal using sudo:

1: git clone https://github.com/RTFM-blackrobe/ARDghost

2: cd ARDghost

3: mv ghostintheshell.sh /opt

4: mv com.apple.ghostintheshell /Users/{your home folder name}/Library/LaunchAgents

5:launchctl load Users/home/Library/Launchagents/com.apple.ghostintheshell

the script will load as a startup item on boot. if you want to disable it 
just go to the folders ad delete the plist and the .sh files

works with latest versions of osx 
Monterrey and Ventura.

cheers!
stay safe. 

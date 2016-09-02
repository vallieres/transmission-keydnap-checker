#!/bin/bash

# Simple script to check if you are infected with the Keydnap malware dropped by an infected version of Transmission 2.92

echo "\n\n#######################################################"
echo "#            Keydnap Malware Checker v.1.0            #"
echo "#    (sadly introduced through Transmission... :'(    #"
echo "#                    👾 👾 👾 👾                     #"
echo "#######################################################\n"
sleep 0.5

echo "👓  Homework  👓\n  Interested in the details of the infection and all?"
echo "  Visit: http://www.welivesecurity.com/2016/08/30/osxkeydnap-spreads-via-signed-transmission-application/"

# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rScan Progress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}
sleep 0.5

echo "\n\n👷  Now scanning for files...\n\n"
ProgressBar 1 100
sleep 0.3

infected=0
title=""
message=""

if [ -f /Applications/Transmission.app/Contents/Resources/License.rtf ]; then
    message="$message 👾 -> /Applications/Transmission.app/Contents/Resources/License.rtf\n"
    infected=1
fi

ProgressBar 10 100
sleep 0.3

if [ -f /Volumes/Transmission/Transmission.app/Contents/Resources/License.rtf ]; then
    message="$message 👾 -> /Volumes/Transmission/Transmission.app/Contents/Resources/License.rtf\n"
    infected=1
fi

ProgressBar 20 100
sleep 0.3

if [ -f $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/icloudsyncd ]; then
    message="$message 👾 -> $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/icloudsyncd\n"
    infected=1
fi

ProgressBar 30 100
sleep 0.5

if [ -d $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/icloudsyncd ]; then
    message="$message 👾 -> $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/icloudsyncd\n"
    infected=1
fi

ProgressBar 40 100
sleep 0.3

if [ -f $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/process.id ]; then
    message="$message 👾 -> $HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/process.id\n"
    infected=1
fi

ProgressBar 50 100
sleep 0.3

if [ -f $HOME/Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist ]; then
    message="$message 👾 -> $HOME/Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist\n"
    infected=1
fi

ProgressBar 60 100
sleep 0.3

if [ -f /Library/Application\ Support/com.apple.iCloud.sync.daemon/ ]; then
    message="$message 👾 -> /Library/Application\ Support/com.apple.iCloud.sync.daemon/\n"
    infected=1
fi

ProgressBar 70 100
sleep 0.3

if [ -d /Library/Application\ Support/com.apple.iCloud.sync.daemon/ ]; then
    message="$message 👾 -> /Library/Application\ Support/com.apple.iCloud.sync.daemon/\n"
    infected=1
fi

ProgressBar 80 100
sleep 0.3

if [ -f $HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist ]; then
    message="$message 👾 -> $HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist\n"
    infected=1
fi

ProgressBar 100 100
sleep 0.5



# Summary
if [ $infected = 1 ]; then
  echo "\n\n\n         🚨 🚨 🚨  INFECTION DETECTED!  🚨 🚨 🚨 "

  echo "\n--------------------------- Infection Report ----------------------------"
  echo "\n 🚨 Malicious File(s) Found! 🚨\n"
  echo "$message"
  echo "-------------------------------------------------------------------------\n\n"

  echo "-------------------------------- Summary --------------------------------\n"
  echo "      👎  NOT 🆗!  👎"
  echo "      You need to cleanup your machine, you are infected by Keydnap!\n"
  echo "      Instructions are available here:"
  echo "      https://github.com/vallieres/transmission-keydnap-checker/cleanup.md\n"
  echo "-------------------------------------------------------------------------\n\n"

else
  echo "\n\n\n          ✨ ✨ ✨  YOU ARE CLEAN!  ✨ ✨ ✨"

  echo "\n\n-------------------------------- Summary --------------------------------\n"
  echo "      👍  Everythin' is A-🆗!  👍"
  echo "      You can now breath and continue your torrenting in peace!\n"
  echo "-------------------------------------------------------------------------\n\n"
fi


echo "📣  Feedback, comment? Head over the GitHub repo to log issues, PR or ⭐!"
echo "      https://github.com/vallieres/transmission-keydnap-checker\n"

echo "Here's a potato: 🍠  (a sweet roasted one, even better!)\n\n"

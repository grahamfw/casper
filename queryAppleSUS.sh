#!/bin/bash
#
# This will query software update to see how many updates are available and will write the value to the 
# availableUpdates key in /var/sandbox/com.company.softwareupdates.plist.
#
pList="/var/sandbox/com.company.softwareupdates.plist"

# Get number of software updates
availableUpdates=`/usr/sbin/softwareupdate -l | grep '*' | wc -l | sed 's/ //g'`

# Write plist values based on number of updates available
if [[ $availableUpdates -gt "0" ]]; then
    /usr/bin/defaults write $pList updatesAvailable -bool YES
    /usr/bin/defaults write $pList availableUpdates -int $availableUpdates
elif [[ $availableUpdates -eq "0" ]]; then
    /usr/bin/defaults write $pList updatesAvailable -bool NO
    /usr/bin/defaults write $pList availableUpdates -int $availableUpdates
fi


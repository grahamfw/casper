#!/bin/bash
#
# Check /var/sandbox/com.company.softwareupdate.plist to see how many updates are available
# Returns "N/A" if the plist doesn't exist.
#
# This is designed to be coupled with a policy that runs once per day that specifically queries softwareupdate to see how many 
# updates are available. Find that here: https://github.com/grahamfw/casper/blob/master/queryAppleSUS.sh

# Edit this file path where you will keep a running list of available software updates.
pList="/var/sandbox/com.company.softwareupdates.plist"

# See if availableUpdates key is set and returns that value
availableUpdates=`/usr/bin/defaults read $pList availableUpdates`

# Determines whether or not updates are available
if [[ ! -f $pList ]]; then
    echo "<result>N/A</result>"
elif [[ $availableUpdates ]]; then
    echo "<result>$availableUpdates</result>"
fi


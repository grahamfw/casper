#!/bin/bash

# Queries the value of the timestamp of when the Apple Setup Wizard was run (assuming the time was correct when it ran).
neworold=`sudo find /var/db/.AppleSetupDone -mtime +30 -exec echo "OLD" \;`

if [[ "$neworold" == "OLD" ]]
then
echo "<result>OLD</result>"
else
echo "<result>NEW</result>"
fi

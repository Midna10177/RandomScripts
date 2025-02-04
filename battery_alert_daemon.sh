#!/usr/bin/bash
scriptName=$(dirname $0)/battery_alert.sh
while [ -f $scriptName ];
do
  $scriptName
  sleep 1
done

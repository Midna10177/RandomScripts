#!/usr/bin/bash

batteryFull=80
batteryLow=20

doAlertLow() {
  echo battery low
  mpv $(dirname $0)/bat_low.ogg
}
doAlertFull() {
  echo battery full
  mpv $(dirname $0)/bat_full.ogg
}

chargePercent=$(acpi | cut -d ',' -f 2 | tr -d ' %')
chargeStatus=$(acpi | cut -d ':' -f 2 | cut -d ',' -f 1 | tr -d ' ')

test $chargeStatus = "Charging"
test $? -eq 1 #equivilent to chargeStatus!="Charging"
isCharging=$?


if [ $isCharging -eq 1 -a $chargePercent -ge $batteryFull ]; then
  doAlertFull
elif [ $isCharging -eq 0 -a $chargePercent -le $batteryLow ]; then
  doAlertLow
fi

#!/bin/bash

# setColorTemp() {
#   export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#   HOUR=$(date +%H)
#   DAY=$(date +%a)
#   COLOR=3700
#   if 	[ ${HOUR} -ge 6 -a ${HOUR} -lt 20 ]; then
#     COLOR=3700
#   elif [ ${HOUR} -ge 20 -a ${HOUR} -lt 21 ]; then 
#     if [[ ${DAY} != "Sat" ]]; then
#       COLOR=3200
#     fi
#   else
#     if [[ ${DAY} == "Sat" ]]; then
#       if [ ${HOUR} -ge 23 ]; then
#         COLOR=1700
#       fi
#     else
#       COLOR=1700
#     fi
#   fi
#   gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature ${COLOR}
# }

# cron every hour
# for exceptional case: manually change, it stays for an hour; repeat if needed
setColorTemp() {
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
  T=$(date +%H%M)  # current time
  if (( T >= 700 && T < 1800 )); then
    TEMP=3700
  elif (( T >= 1800 && T < 1900 )); then
    TEMP=2700
  else
    TEMP=1700
  fi
  gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature ${TEMP}
}

setColorTemp

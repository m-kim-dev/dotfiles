#!/bin/bash

# cron every hour
# for exceptional case: manually change, it stays for an hour; repeat if needed
setColorTemp() {
  export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
  T=10#$(date +%H%M)  # current time
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

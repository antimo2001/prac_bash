#!/bin/bash
DEBUG="fn3:fn4"

function fnLogDebug {
  RETVAL=99
  if [ -n $1 ]; then
    echo $DEBUG | grep -q "$1"
    RETVAL=$?
  fi
  return $RETVAL
}

function fn2 {
  M="Shell Scripting is fun!"
  echo $M
}

fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2

function fn3 {
  H=$(hostname)
  M="This script is running on ${H}"
  echo $M
}

fnLogDebug "fn3" && echo "...Debug: run fn3" && fn3

## -----------------------------------------------------------------------------
## Check if /etc/shadow file exists and check if writable
function fn4 {
  SHADOWF=/etc/shadow
  if [ -f $SHADOWF ]; then
    echo "Shadow passwords are enabled"

    if [ -w $SHADOWF ]; then
      echo "You have permissions to edit $SHADOWF"
    else
      echo "You Do not have permissions to edit $SHADOWF"
    fi
  else
    echo "Shadow file does NOT exist"
  fi
}

fnLogDebug "fn4" && echo "...Debug: run fn4" && fn4

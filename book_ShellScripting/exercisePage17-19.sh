#!/bin/bash
DEBUG="fn2,fn3,fn4"

function fnLogDebug {
  local RETVAL=99
  local MATCH=$1
  if [ -n $MATCH ]; then
    echo $DEBUG | grep -q "$MATCH"
    RETVAL=$?
  fi
  return $RETVAL
}

function fn2 {
  local MSG="Shell Scripting is fun!"
  echo $MSG
}

function fn3 {
  local H=$(hostname)
  local MSG="This script is running on ${H}"
  echo $MSG
}

## -----------------------------------------------------------------------------
## Check if /etc/shadow file exists and check if writable
function fn4 {
  local SHADOWF=/etc/shadow
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

fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2
fnLogDebug "fn3" && echo "...Debug: run fn3" && fn3
fnLogDebug "fn4" && echo "...Debug: run fn4" && fn4

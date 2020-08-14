#!/bin/bash
DEBUG="fn3,fn2,fn1"

function fnLogDebug {
  local RETVAL=99
  local MATCH=$1
  if [ -n $MATCH ]; then
    echo $DEBUG | grep -q "$MATCH"
    RETVAL=$?
  fi
  return $RETVAL
}

function fn1 {
  local MSG="Shell Scripting is fun!"
  echo $MSG
}

function fn2 {
  local H=$(hostname)
  echo "NotYetImplemented"
}

## -----------------------------------------------------------------------------
## Check if /etc/shadow file exists and check if writable
function fn3 {
  echo "NotYetImplemented"
}

fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2
fnLogDebug "fn3" && echo "...Debug: run fn3" && fn3

#!/bin/bash
DEBUG="fn2,fn1"

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
  local ERR_CODE=0
  echo "This will exit with zero exit status"
  return $ERR_CODE
}

function fn2 {
  echo "NotYetImplemented"
  return $?
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2

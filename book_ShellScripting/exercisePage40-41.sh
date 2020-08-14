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

## -----------------------------------------------------------------------------
## Display number of files in PWD
function fnCountFiles {
  local COUNTFILE1=$(ls | wc -l)
  local COUNTFILE2=$(ls -l | tail --lines=+2 | wc -l)

  echo "COUNTFILE1==$COUNTFILE1"
  echo "COUNTFILE2==$COUNTFILE2"

  if [ $COUNTFILE1 -eq $COUNTFILE2 ]; then
    echo "counts are equal"
  else
    echo "counts are NOT equal!!"
  fi
}

function fn1 {
  fnCountFiles
}

function fn2 {
  echo "NotYetImplemented"
  return $?
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2

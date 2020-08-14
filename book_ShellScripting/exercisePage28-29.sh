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
  local ERR_CODE=0
  echo "This will exit with zero exit status"
  return $ERR_CODE
}

## -----------------------------------------------------------------------------
## Returns ERR_CODE based on which filetype is the given file
## Reusable for Exercises 2,3
function fnFileThing {
  local FILE=$1
  local ERR_CODE=2

  if [ -f $FILE ]; then
    ERR_CODE=0
  elif [ -d $FILE ]; then
    ERR_CODE=1
  else
    ERR_CODE=2
  fi

  echo "ERR_CODE is $ERR_CODE"
  return $ERR_CODE
}

function fn2 {
  fnFileThing $1
  return $?
}

function fn3 {
  local ERR_CODE
  cat /etc/shadow
  ERR_CODE=$?

  if [ $ERR_CODE -eq 0 ]; then
    echo "cat /etc/shadow command succeeded"
  else
    echo "cat /etc/shadow command failed"
    ERR_CODE=1
  fi

  return $ERR_CODE
}

fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2
fnLogDebug "fn3" && echo "...Debug: run fn3" && fn3

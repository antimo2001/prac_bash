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
  local DIR1=$1
  test -z $DIR1 && return 1

  local COUNTFILE1=$(ls ${DIR1} | wc -l)
  local COUNTFILE2=$(ls -l ${DIR1} | tail --lines=+2 | wc -l)

  echo "COUNTFILE1==$COUNTFILE1"
  echo "COUNTFILE2==$COUNTFILE2"

  if [ $COUNTFILE1 -eq $COUNTFILE2 ]; then
    echo "counts are equal"
  else
    echo "counts are NOT equal!!"
  fi

  echo "$DIR1:"
  echo "$COUNTFILE1"

  return $COUNTFILE1
}

function fn1 {
  fnCountFiles $PWD
}

function fn2 {
  DIRS="/etc /var /usr/bin"
  for VAR in $DIRS; do
    fnCountFiles $VAR
  done
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2

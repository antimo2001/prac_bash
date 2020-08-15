#!/bin/bash
DEBUG="fn,fn1"

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
## Copy all txt files and put the date in the filename
function fnCopyTxtWithDate {
  local DIR1=$1
  test -z "$DIR1" && echo "...using default PWD" && DIR1=$PWD

  ## Enable shell-option to ignore errors when no globs found
  shopt -s nullglob
  pushd . |& /dev/null
  cd $DIR1

  local FILES=$(ls *txt)
  local DATE=$(date +%F)

  for VAR in $FILES; do
    if [ -f "$VAR" ]; then
      cp -v "$VAR" "${DATE}-${VAR}"
    fi
  done

  popd |& /dev/null
  shopt -u nullglob
}

function fn1 {
  fnCopyTxtWithDate $1
}

function fn2 {
  echo "NotYetImplemented"
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1 $@
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2

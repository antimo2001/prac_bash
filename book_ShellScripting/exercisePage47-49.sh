#!/bin/bash
DEBUG="fn2,fn0"

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

  local EXT=$2
  test -z "$EXT" && echo "...using default txt" && EXT="txt"

  local DATE=$(date +%F)
  local PREFIX=$3
  test -z "$PREFIX" && PREFIX=$DATE

  echo "...PREFIX: $PREFIX"

  ## Enable shell-option to ignore errors when no globs found
  shopt -s nullglob
  pushd . |& /dev/null
  cd $DIR1

  local FILES=$(ls *${EXT})

  for VAR in $FILES; do
    if [ -f "$VAR" ]; then
      cp -v "$VAR" "${PREFIX}-${VAR}"
    fi
  done

  popd |& /dev/null
  shopt -u nullglob
}

function fn1 {
  fnCopyTxtWithDate $1
}

function fn2 {
  fnCopyTxtWithDate $@
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1 $@
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2 $@

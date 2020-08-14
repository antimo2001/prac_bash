#!/bin/bash
DEBUG="fn4,fn5,fn6"

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
  if [ -f "$SHADOWF" ]; then
    echo "Shadow passwords are enabled"

    if [ -w "$SHADOWF" ]; then
      echo "You have permissions to edit $SHADOWF"
    else
      echo "You Do not have permissions to edit $SHADOWF"
    fi
  else
    echo "Shadow file does NOT exist"
  fi
}

## -----------------------------------------------------------------------------
## For loop to print man,bear,pig,dog,cat,sheep
function fn5 {
  local zoo="man bear pig dog cat sheep"
  for VAR in $zoo; do
    echo $VAR
  done
}

## -----------------------------------------------------------------------------
## Exercise 6
function fn6 {
  local DEFAULT="Other type of file: "
  local filetype=$DEFAULT

  read -p "Enter name of file or directory: " FILE

  if [ -f $FILE ]; then
    filetype="Regular file: ${FILE}"
  elif [ -d $FILE ]; then
    filetype="Directory file: ${FILE}"
  fi

  echo $filetype | tee | grep -q "[^$DEFAULT]"
  local XCODE=$?
  test $XCODE -eq 0 && ls -l $FILE
}

fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2
fnLogDebug "fn3" && echo "...Debug: run fn3" && fn3
fnLogDebug "fn4" && echo "...Debug: run fn4" && fn4
fnLogDebug "fn5" && echo "...Debug: run fn5" && fn5
fnLogDebug "fn6" && echo "...Debug: run fn6" && fn6

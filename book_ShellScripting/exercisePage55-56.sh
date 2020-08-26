#!/bin/bash
DEBUG="fn0,fn2"

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
function fn1 {
  cat <<CODESERVER
echo "#!/bin/bash"

## This simulates a server or daemon

PID_FILE="/tmp/sleep-sim-srv.pid"
trap '"rm $PID_FILE; exit"' SIGHUP SIGINT SIGTERM
echo '$$ > $PID_FILE'

while true; do
:
done
CODESERVER
}


## -----------------------------------------------------------------------------
## This startup script is for sleep-sim-srv
## takes 1 arg: start,stop
function fn2 {
  ARG1="$1"

  case $ARG1 in
    start|START)
      /tmp/sleep-sim-srv &
      ;;
    stop|STOP)
      kill $(cat /tmp/sleep-sim-srv.pid)
      ;;
    *)
      echo "USAGE: $0 start|stop"
      exit 1
      ;;
  esac
}


fnLogDebug "fn1" && echo "...Debug: run fn1" && fn1 $@
fnLogDebug "fn2" && echo "...Debug: run fn2" && fn2 $@

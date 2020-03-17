#!/bin/sh

COMMAND=${1:-run}

run() {
  if [ -t 1 ]
  then
    /bin/bash
  else
    echo "Run command requires an interactive tty. If running with Docker/Kubernetes add the -it flag"
  fi
}

k8s() {
  cat /toolkit/k8s-pod.yaml
}

waitforever() {
  while :
  do
    sleep 6000 &
    wait $!
  done
}

case "$COMMAND" in
  wait)  waitforever ;;
  run)  run ;;
  k8s)  k8s ;;
  *) echo "Unknown command $COMMAND"
esac



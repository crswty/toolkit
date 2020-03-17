#!/bin/sh

COMMAND=${1:-run}

run() {
  /bin/bash
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



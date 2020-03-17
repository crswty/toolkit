#!/bin/sh

COMMAND=${1:-run}

run() {
  /bin/bash
}

k8s() {
  cat /toolkit/k8s-pod.yaml
}

waitforever() {
  sleep infinity &
  wait $!
}

case "$COMMAND" in
  wait)  waitforever ;;
  run)  run ;;
  k8s)  k8s ;;
  *) echo "Unknown command $COMMAND"
esac



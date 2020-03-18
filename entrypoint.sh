#!/bin/sh

COMMAND=${1:-run}

help() {
  cat <<EOF
Commands:
  run - Run the container starting a new bash session
  wait - Start the container making it run forever
  k8s - Print out a Kubernetes Pod resource that can be used to create a running toolkit in k8s
  help - show the help
EOF
}

run() {
  if [ -t 1 ]
  then
    /bin/bash
  else
    error "Run command requires an interactive tty. If running with Docker/Kubernetes add the -it flag"
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

error() {
  echo "ERR: $1"
  echo
  help
  exit 1
}

case "$COMMAND" in
  wait) waitforever ;;
  run)  run ;;
  k8s)  k8s ;;
  help) help ;;
  *) error "Unknown command $COMMAND"
esac




# toolkit

This 'toolkit' container provides a number of useful tools for debugging 
things running either locally or in Kubernetes

## Run online
Runs /bin/bash for interactive session
```
docker run -it crswty/toolkit:latest
```

## Run and wait
Container can run forever so it can be attached to with docker or k8s exec
```
docker run crswty/toolkit:latest wait
```

## Run in Kubernetes
Container can print the output to run the toolkit as a long running pod 
which you can then kubectl exec into
```
docker run crswty/toolkit:latest k8s | kubectl apply -f-
kubectl exec -it toolkit /bin/bash
```
Tear it down with
```
docker run crswty/toolkit:latest k8s | kubectl delete -f-
```

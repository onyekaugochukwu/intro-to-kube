#!/bin/bash

DEPLOYMENT_PODS=$(kubectl get pods -l app=just-a-pod -o custom-columns=:metadata.name --no-headers)

for POD in $DEPLOYMENT_PODS; do
  # Generate a unique prefix using the Pod name
  PREFIX="${POD}_"
  
  # Copy the log file from each Pod to your local machine with the unique prefix
  kubectl cp $POD:/tmp/foo.log /workspaces/intro-to-kube/cyber-monday/"$PREFIX"foo.log
done

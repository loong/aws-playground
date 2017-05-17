#!/bin/bash

CLUSTER_ID=`aws emr list-clusters  | jq -r '.Clusters[0].Id'`
INSTANCE=`aws emr list-instances --cluster-id $CLUSTER_ID --instance-group-types CORE`
IP=`echo "$INSTANCE" | jq '.Instances[0].PublicIpAddress' | tr -d '"'`

echo "Setting up master instance at $IP of cluster $CLUSTER_ID"
ssh -oStrictHostKeyChecking=no hadoop@$IP \
    "sudo yum -y install emacs"

echo DONE

#!/usr/bin/env bash

GEN_SSH_KEYS="${GEN_SSH_KEYS:=0}" 

if [ ! -f /tmp/go-aws-credentials ]; then
   if [ ! -z "$AWS_ACCESS_KEY" ]; then
      echo "[default]" > /tmp/go-aws-credentials
      echo "aws_access_key_id = $AWS_ACCESS_KEY" >> /tmp/go-aws-credentials
      echo "aws_secret_access_key = $AWS_ACCESS_SECRET" >> /tmp/go-aws-credentials
   fi
fi


if [ ! -f /tmp/go-ssh ]; then
   if [ $GEN_SSH_KEYS -ne 0 ]; then
      ssh-keygen -t rsa -q -f /tmp/go-ssh  -N "" 
   fi
fi 

exec "$@"

#!/usr/bin/env bash

ansible --version
terraform --version

echo "GEN_SSH_KEYS=$GEN_SSH_KEYS"
ls -l /tmp

go-deploy -init --working-directory aws
go-deploy --working-directory aws -w test-go-deploy -c config.yml.sample
public_ip=`terraform -chdir=aws output -raw public_ip`
echo $public_ip
ssh -i /tmp/go-ssh ubuntu@$public_ip ls -l stage_dir/test_file
ret=$?
go-deploy --working-directory aws -w test-go-deploy -destroy
exit $ret 

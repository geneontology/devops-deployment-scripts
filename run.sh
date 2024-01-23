#!/usr/bin/env bash

set -e

ansible --version
terraform --version
go-deploy -version

ls -l /tmp

go-deploy -init --working-directory aws -verbose
go-deploy -d aws -list-workspaces
go-deploy --working-directory aws -w cicd-test-go-deploy -c config.yml.sample -verbose
go-deploy -d aws -w cicd-test-go-deploy -output
go-deploy --workspace cicd-test-go-deploy --working-directory aws -verbose -show
public_ip=`terraform -chdir=aws output -raw public_ip`
echo $public_ip
ssh -i /tmp/go-ssh ubuntu@$public_ip ls -l stage_dir/test_file
ret=$?
go-deploy -d aws -list-workspaces
go-deploy --working-directory aws -w cicd-test-go-deploy -destroy -verbose
go-deploy -d aws -list-workspaces
exit $ret 

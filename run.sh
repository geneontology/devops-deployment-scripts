#!/usr/bin/env bash

ls -l /tmp

go-deploy -init --working-directory aws
go-deploy --working-directory aws -w production-2023-10-01 -c config.yml.sample
go-deploy --working-directory aws -w production-2023-10-01 -destroy

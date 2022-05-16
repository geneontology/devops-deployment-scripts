# devops-deployment-scripts

Provisions an aws instance using terraform and calls ansible-playbook with playbooks specified in 
the yaml config file. See config.yaml.sample.


'''
python3 -m pip install . 
cp ./config.yaml.sample config.yaml   # Modify as needed ssh keys, ...

# Usage
go-deploy -h

# Dry run
go-deploy -init -c config.yml -w workspace -d aws -dry-run -verbose

# Deploy 
go-deploy -init -c config.yml -w workspace -d aws -verbose

# Tear Dow
terraform -chdir=aws destroy    # Enter yes when prompted.
'''

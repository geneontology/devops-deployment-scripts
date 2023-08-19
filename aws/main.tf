variable "tags" {
  type = map
  default = { Name = "test-go-provision" }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "disk_size" {
  default = 10
  description = "size of disk in Gigabytes"
}

variable "public_key_path" {
  default = "/tmp/go-ssh.pub"
}

provider "aws" {
  region = "us-east-1" 
  shared_credentials_files = [ "/tmp/go-aws-credentials" ]
  profile = "default"
}

// optional will be created if value is not an menty string
variable "dns_record_name" {
  type = string
  description = "type A DNS record wich will be mapped to public ip"
  default = ""
}

variable "dns_zone_id" {
  type = string
  description = "zone id for dns record."
  default = ""
}

variable "use_elastic_ip" {
  type = bool
  description = "whether to use an elastic ip or not"
  default = true
}

module "base" {
  source = "git::https://github.com/geneontology/devops-aws-go-instance.git?ref=V3.0"
  instance_type = var.instance_type
  public_key_path = var.public_key_path
  tags = var.tags
  open_ports = [80, 22]
  disk_size = var.disk_size
  dns_record_name = var.dns_record_name
  dns_zone_id = var.dns_zone_id
  use_elastic_ip = var.use_elastic_ip
}

output "public_ip" {
   value                  = module.base.public_ip
}

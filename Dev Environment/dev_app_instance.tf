provider "aws" {
  region     = "us-east-1"
}

module "EC2" {
  source = "git@github.com:HT-Devops/Terraform_Training.git//Modules/EC2"
  instance_type = var.instance_type
}

module "EBS" {
  source = "git@github.com:HT-Devops/Terraform_Training.git//Modules/EBS"
  size   = var.size
  }

resource "aws_volume_attachment" "ebs_attchment_1" {
  device_name = "/dev/sdh"
  volume_id   = "${module.EBS.ebs_id}"
  instance_id = "${module.EC2.ec2_id}"
}

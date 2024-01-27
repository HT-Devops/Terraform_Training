resource "aws_ebs_volume" "Vol1" {
  availability_zone = "us-east-1a"
  size              = var.size

  tags = {
    Name = "HelloWorld"
  }
}

output "ebs_id" {
    value = "${aws_ebs_volume.Vol1.id}"
}

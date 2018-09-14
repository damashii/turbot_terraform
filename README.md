Terraform module for gathering turbot info

variable aws_profile should match turbot account id


Sample:
```
module "turbot" {
  source = "./modules/turbot"
  aws_profile = "aay"
}

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "test"
  instance_count = 1
  instance_type = "c4.large"
  ami = "${data.aws_ami.ecs_ami.id}"
  vpc_security_group_ids = "${module.turbot.turbot_default_sg}"
  subnet_id = "${module.turbot.turbot_int_subnets[0]}"
  key_name = "turbot"
}
```

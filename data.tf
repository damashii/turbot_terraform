data "aws_caller_identity" "current" {}

data "aws_iam_policy" "logging" {
  arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/EC2InstanceLogging"
}

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["${var.aws_profile}${var.reg["${var.aws_region}"]}"]
  }
}

data "aws_subnet_ids" "internal" {
  vpc_id = "${data.aws_vpc.selected.id}"
  tags {
    Name = "${var.aws_profile}${var.reg["${var.aws_region}"]} internal*"
  }
}

data "aws_subnet_ids" "dmz" {
  vpc_id = "${data.aws_vpc.selected.id}"
  tags {
    Name = "${var.aws_profile}${var.reg["${var.aws_region}"]} dmz*"
  }
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.selected.id}"
  filter {
    name = "group-name"
    values = ["default"]
  }
}

data "aws_security_group" "webvpc" {
  vpc_id = "${data.aws_vpc.selected.id}"
  filter {
    name = "group-name"
    values = ["${var.aws_profile}${var.reg["${var.aws_region}"]}-WebVPC-*"]
  }
}


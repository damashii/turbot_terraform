output "Account" {
  value = "${var.aws_profile}"
}

output "loggingarn" {
  value = "${data.aws_iam_policy.logging.description}"
}

output "turbot_vpc" {
  value = "${data.aws_vpc.selected.id}"
}

output "turbot_dmz_subnets" {
  value = "${data.aws_subnet_ids.dmz.ids}"
}

output "turbot_int_subnets" {
  value = "${data.aws_subnet_ids.internal.ids}"
}

output "turbot_default_sg" {
  value = "${data.aws_security_group.default.id}"
}

output "turbot_webvpc_sg" {
  value = "${data.aws_security_group.webvpc.id}"
}

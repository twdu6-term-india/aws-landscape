resource "aws_instance" "kafka1" {
  ami                    = "${data.aws_ami.training_kafka.image_id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.kafka.id}"]
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.ec2_key_pair}"
  iam_instance_profile   = "${aws_iam_instance_profile.kafka.name}"
  user_data              = "${data.template_cloudinit_config.zookeeper1__conf.rendered}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "kafka1-${var.deployment_identifier}"
    )
  )}"
}

resource "aws_instance" "kafka2" {
  ami                    = "${data.aws_ami.training_kafka.image_id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.kafka.id}"]
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.ec2_key_pair}"
  iam_instance_profile   = "${aws_iam_instance_profile.kafka.name}"
  user_data              = "${data.template_cloudinit_config.zookeeper2__conf.rendered}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "kafka2-${var.deployment_identifier}"
    )
  )}"
}

resource "aws_instance" "kafka3" {
  ami                    = "${data.aws_ami.training_kafka.image_id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.kafka.id}"]
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.ec2_key_pair}"
  iam_instance_profile   = "${aws_iam_instance_profile.kafka.name}"
  user_data              = "${data.template_cloudinit_config.zookeeper3__conf.rendered}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "kafka3-${var.deployment_identifier}"
    )
  )}"
}

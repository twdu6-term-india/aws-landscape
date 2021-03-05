resource "aws_route53_record" "kafka" {
  zone_id = "${var.dns_zone_id}"
  name    = "kafka"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.kafka.private_dns}"]
}

resource "aws_route53_record" "kafka1" {
  zone_id = "${var.dns_zone_id}"
  name    = "kafka1"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.kafka1.private_dns}"]
}

resource "aws_route53_record" "kafka2" {
  zone_id = "${var.dns_zone_id}"
  name    = "kafka2"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.kafka2.private_dns}"]
}

resource "aws_route53_record" "kafka3" {
  zone_id = "${var.dns_zone_id}"
  name    = "kafka3"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.kafka3.private_dns}"]
}

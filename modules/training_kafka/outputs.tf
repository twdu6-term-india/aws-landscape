output "kafka1_address" {
  description = "The DNS address of the kafka1 instance."
  value       = "${aws_route53_record.kafka1.fqdn}"
}

output "kafka2_address" {
  description = "The DNS address of the kafka2 instance."
  value       = "${aws_route53_record.kafka2.fqdn}"
}

output "kafka3_address" {
  description = "The DNS address of the kafka3 instance."
  value       = "${aws_route53_record.kafka3.fqdn}"
}

output "kafka_security_group_id" {
  description = "Security group of Kafka instance."
  value       = "${aws_security_group.kafka.id}"
}

output "kafka1_instance_id" {
  description = "The instance id."
  value       = "${aws_instance.kafka1.id}"
}

output "kafka2_instance_id" {
  description = "The instance id."
  value       = "${aws_instance.kafka2.id}"
}

output "kafka3_instance_id" {
  description = "The instance id."
  value       = "${aws_instance.kafka3.id}"
}
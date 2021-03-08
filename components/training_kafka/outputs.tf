output "kafka1_address" {
  description = "The DNS address of the Kafka1 node."
  value       = "${module.training_kafka.kafka1_address}"
}

output "kafka2_address" {
  description = "The DNS address of the Kafka2 node."
  value       = "${module.training_kafka.kafka2_address}"
}

output "kafka3_address" {
  description = "The DNS address of the Kafka3 node."
  value       = "${module.training_kafka.kafka3_address}"
}

output "kafka_security_group_id" {
  description = "Security group of Kafka instance."
  value       = "${module.training_kafka.kafka_security_group_id}"
}

output "kafka1_instance_id" {
  description = "The instance id."
  value       = "${module.training_kafka.kafka1_instance_id}"
}

output "kafka2_instance_id" {
  description = "The instance id."
  value       = "${module.training_kafka.kafka2_instance_id}"
}

output "kafka3_instance_id" {
  description = "The instance id."
  value       = "${module.training_kafka.kafka3_instance_id}"
}

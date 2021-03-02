resource "aws_sns_topic" "tf_aws_sns_topic_with_subscription" {
  name = "stale-hdfs-mart-location"
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint twdu6-india@thoughtworks.com"
    environment = {
      sns_arn = "${self.arn}"
      sns_emails = "twdu6-india@thoughtworks.com"
    }
  }
}

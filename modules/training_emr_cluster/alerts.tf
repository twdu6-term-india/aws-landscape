resource "aws_cloudwatch_metric_alarm" "stale_hdfs_location_alert" {
  alarm_name                = "Stale HDFS mart location"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "${var.metric_name}"
  namespace                 = "Custom"
  period                    = "300"
  statistic                 = "Maximum"
  threshold                 = "5"
  alarm_description         = "This metric monitors HDFS mart location"
  alarm_actions = ["${aws_sns_topic.tf_aws_sns_topic_with_subscription.arn}"]
}

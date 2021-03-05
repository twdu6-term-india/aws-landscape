data "local_file" "zookeeper2_dependencies" {
  filename = "${path.module}/scripts/createZookeeperIds2.sh"
}

data "template_cloudinit_config" "zookeeper2__conf" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = "${data.local_file.zookeeper2_dependencies.content}"
  }
}

data "local_file" "zookeeper3_dependencies" {
  filename = "${path.module}/scripts/createZookeeperIds3.sh"
}

data "template_cloudinit_config" "zookeeper3__conf" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = "${data.local_file.zookeeper3_dependencies.content}"
  }
}

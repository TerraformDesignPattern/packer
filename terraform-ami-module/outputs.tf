output "docker_image_id" {
  value = "${lookup(var.docker_image_ids, var.aws_region)}"
}

output "base_image_id" {
  value = "${lookup(var.base_image_ids, var.aws_region)}"
}

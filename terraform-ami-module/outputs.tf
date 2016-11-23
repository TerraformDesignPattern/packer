output "docker_image_id" {
    value = "${lookup(var.docker_image_ids, var.aws_region)}"
}

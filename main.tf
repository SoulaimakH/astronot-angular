provider "null" {}

resource "null_resource" "echo_message" {
  provisioner "local-exec" {
    command = "echo 'Hello, Terraform!'"
  }
}

resource aws_ecr_repository "repository" {
  name                 = "${local.resource_prefix.value}-repository"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name                 = "${local.resource_prefix.value}-repository"
    git_commit           = "42d7d387f7aa3eb58745d74f567729f5f5bca493"
    git_file             = "terraform/aws/ecr.tf"
    git_last_modified_at = "2023-03-01 20:22:35"
    git_last_modified_by = "40035609+ghouldaemon@users.noreply.github.com"
    git_modifiers        = "40035609+ghouldaemon"
    git_org              = "ghouldaemon"
    git_repo             = "terragoated"
    yor_trace            = "62b4c542-6734-4fa4-83b1-bc7f0cc26332"
    yor_name             = "repository"
  }
}

locals {
  docker_image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com/${aws_ecr_repository.repository.name}"
}


resource null_resource "push_image" {
  provisioner "local-exec" {
    working_dir = "${path.module}/resources"
    command     = <<BASH
    aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com
    docker build -t ${aws_ecr_repository.repository.name} .
    docker tag ${aws_ecr_repository.repository.name} ${local.docker_image}
    docker push ${local.docker_image}
    BASH
  }
}
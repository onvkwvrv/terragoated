resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    git_commit           = "42d7d387f7aa3eb58745d74f567729f5f5bca493"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2023-03-01 20:22:35"
    git_last_modified_by = "40035609+ghouldaemon@users.noreply.github.com"
    git_modifiers        = "40035609+ghouldaemon"
    git_org              = "ghouldaemon"
    git_repo             = "terragoated"
    yor_trace            = "651492b6-4d42-4633-a9ce-3b9be25b9152"
    yor_name             = "logs_key"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}


resource "aws_kms_key" "customer_key" {
  # key does not have rotation enabled
  description         = "${local.resource_prefix.value}-customer bucket key"
  enable_key_rotation = var.enable_key_rotation

  deletion_window_in_days = 7
  tags = {
    git_commit           = "42d7d387f7aa3eb58745d74f567729f5f5bca493"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2023-03-01 20:22:35"
    git_last_modified_by = "40035609+ghouldaemon@users.noreply.github.com"
    git_modifiers        = "40035609+ghouldaemon"
    git_org              = "ghouldaemon"
    git_repo             = "terragoated"
    yor_trace            = "5fbd52d8-2726-4d86-afaf-836296566d69"
    yor_name             = "customer_key"
  }
}

resource "aws_kms_alias" "customer_key_alias" {
  name          = "alias/${local.resource_prefix.value}-customer-bucket-key"
  target_key_id = "${aws_kms_key.customer_key.key_id}"
}

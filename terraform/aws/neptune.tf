resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.neptune-dbname
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  apply_immediately                   = true
  storage_encrypted                   = false
  tags = {
    git_commit           = "42d7d387f7aa3eb58745d74f567729f5f5bca493"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2023-03-01 20:22:35"
    git_last_modified_by = "40035609+ghouldaemon@users.noreply.github.com"
    git_modifiers        = "40035609+ghouldaemon"
    git_org              = "ghouldaemon"
    git_repo             = "terragoated"
    yor_trace            = "0d4cbb85-73ed-4ca0-b1da-296e4185f34e"
    yor_name             = "default"
  }
}

resource "aws_neptune_cluster_instance" "default" {
  count              = 1
  cluster_identifier = aws_neptune_cluster.default.id
  engine             = "neptune"
  instance_class     = "db.t3.medium" # Smallest instance type listed for neptune https://aws.amazon.com/neptune/pricing/
  apply_immediately  = true
  #publicly_accessible                = true # No longer supported, API returns create error. See https://docs.aws.amazon.com/neptune/latest/userguide/api-instances.html#CreateDBInstance
  tags = {
    git_commit           = "42d7d387f7aa3eb58745d74f567729f5f5bca493"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2023-03-01 20:22:35"
    git_last_modified_by = "40035609+ghouldaemon@users.noreply.github.com"
    git_modifiers        = "40035609+ghouldaemon"
    git_org              = "ghouldaemon"
    git_repo             = "terragoated"
    yor_trace            = "9b2b45fd-6f9f-44fd-b8bc-868b1db178b3"
    yor_name             = "default"
  }
}

resource "aws_neptune_cluster_snapshot" "default" {
  db_cluster_identifier          = aws_neptune_cluster.default.id
  db_cluster_snapshot_identifier = "resourcetestsnapshot1"
}


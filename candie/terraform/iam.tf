module "iam" {
  source = "git::ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/orca-terraform-modules//modules/aws-iam-role"

  role_name = var.iam_role_name
  cluster_arn = var.aws_cluster_arn
}
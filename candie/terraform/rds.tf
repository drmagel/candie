module "candie_db" {

  source = "git::ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/orca-terraform-modules//modules/aws-rds"
  
  identifier = var.rds_identifier

  engine            = var.rds_engine
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  multi_az          = var.rds_multi_az

  db_name  = var.rds_db_name
  username = var.rds_username
  password = var.rds_password
  port     = 3306

  vpc_security_group_ids = var.rds_vpc_security_group_ids

  auto_minor_version_upgrade = var.rds_auto_minor_version_upgrade
  maintenance_window = var.rds_maintenance_window
  backup_window      = var.rds_backup_window
  backup_retention_period = var.rds_backup_retention_period

  create_random_password = false
  create_db_option_group = false
  create_db_parameter_group = false
}

// Route53 - data
resource "aws_route53_record" "candie_route" {
  zone_id = data.aws_route53_zone.aws_domain.zone_id
  name    = var.rds_identifier
  type    = "CNAME"
  ttl     = "300"
  allow_overwrite = "true"
  records = [module.candie_db.db_instance_address]
}
fruit = "{{ FRUIT }}"
//
aws_region = "{{ aws_region }}"
aws_profile = "{{ aws_profile }}"
aws_cluster_arn="{{ aws_cluster_arn }}"
aws_vpc_id = "{{ aws_vpc_id }}"
aws_domain = "{{ aws_domain_name }}"

// IAM
iam_role_name = "{{container.iam_role}}"

// RDS
rds_engine = "{{rds.engine}}"
rds_engine_version = "{{rds.engine_version}}"
rds_instance_class = "{{rds.instance_class}}"
rds_allocated_storage = "{{rds.allocated_storage}}"
rds_multi_az = "{{rds.multi_az}}"
rds_identifier = "{{rds.identifier}}"
rds_db_name = "{{rds.db_name}}"
rds_username = "{{rds.username}}"
rds_password = "{{rds.password | b64decode | trim }}"
rds_auto_minor_version_upgrade = "{{rds.auto_minor_version_upgrade}}"
rds_maintenance_window = "{{rds.maintenance_window}}"
rds_backup_window = "{{rds.backup_window}}"
rds_backup_retention_period = "{{rds.backup_retention_period}}"
rds_vpc_security_group_ids = [{{rds.vpc_security_group_ids}}]
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-{{ FRUIT}}"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket = "{{ STATES_BUCKET }}"
    dynamodb_table = "terraform-state-lock-{{ FRUIT }}"
    key    = "terraform/{{ FRUIT }}/terraform.tfstate"
    region = "{{ aws_region }}"
  }
}
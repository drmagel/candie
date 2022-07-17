data "aws_route53_zone" "aws_domain" {
  name         = "${var.aws_domain}."
  private_zone = false
}

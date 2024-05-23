terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.50.0"
      }
    }
}

resource "aws_route53_record" "tomaetest" {
    count           = contains(var.products, "tomatest") ? 1 : 0
    zone_id         = var.tomaetest_zone_id
    name            = "${var.customer_name}.com"
    type            = var.tomaetest_record_type
    ttl             = var.ttl
    records         = var.tomaetest_records
}

resource "aws_route53_record" "tomagrade" {
    count           = contains(var.products, "tomagrade") ? 1 : 0
    zone_id         = var.tomagrade_zone_id
    name            = "${var.customer_name}.com"
    type            = var.tomagrade_record_type
    ttl             = var.ttl
    records         = var.tomagrade_records
}


resource "aws_route53_record" "tomasafe" {
    count           = contains(var.products, "tomasafe") ? 1 : 0
    zone_id         = var.tomasafe_zone_id
    name            = "${var.customer_name}.com"
    type            = var.tomasafe_record_type
    ttl             = var.ttl
    records         = var.tomasafe_records
  
}
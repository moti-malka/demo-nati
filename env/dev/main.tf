terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.50.0"
      }
    }
}


module "route53" {
    source = "../../modules/route53"
    for_each = { for idx, customer in var.customers : idx => customer }
    customer_name = each.value.name
    products = each.value.products
    env = var.env
}

module "s3" {
    source = "../../modules/s3"
    for_each      = { for idx, customer in var.customers : idx => customer }
    customer_name = each.value.name
    db_password   = each.value.db_password
    env           = each.value.env
    products      = each.value.products
}

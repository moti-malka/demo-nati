variable "customer_name" {
  description = "The name of the customer"
  type        = string
}

variable "products" {
  description = "The products"
  type        = list(string)  
}

variable "env" {
  description = "The environment"
  type        = string
  
}

variable "db_password" {
  description = "The database password"
  type        = string
  
}

variable "env" {
  description = "The environment"
  type        = string
  default     = "dev"
  
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-1"
  
}

variable "customers" {
  description = "List of string to represent customers"
  type        = list(object({
    name = string
    products = list(string)
  }))
  default = [ {
    name      = "netanel"
    products  = ["tomaetest", "tomagrade", "tomasafe"]
    },
    {
    name      = "tomer"
    products  = ["tomaetest", "tomagrade"]
    }
  ]
}

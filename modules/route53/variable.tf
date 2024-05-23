variable "customer_name" {
  description = "The name of the customer"
  type        = string
}

variable "env" {
  description = "The environment"
  type        = string
}

variable "products" {
  description = "A list of services to configure (tomaetest, tomagrade, tomasafe)"
  type        = list(string)
  
}
variable "tomaetest_zone_id" {
  description = "The zone id of the tomaetest"
  type        = string
  default = "sddsdsds"
}

variable "tomaetest_record_type" {
  description = "The record type of the tomaetest"
  type        = string
  default     = "CNAME"
}

variable "ttl" {
  description = "The TTL of the record"
  type        = number
  default     = 300
}

variable "tomaetest_records" {
  description = "The records of the tomaetest"
  type        = list(string)
  default     = ["dsdsdsdss.cloudfront.net"]
  
}

variable "tomagrade_zone_id" {
  description = "The zone id of the tomagrade"
  type        = string
  default = "dsdsdsdsds"
  
}

variable "tomagrade_record_type" {
  description = "The record type of the tomagrade"
  type        = string
  default     = "CNAME"
}

variable "tomagrade_records" {
  description = "The records of the tomagrade"
  type        = list(string)
  default     = ["xscsfssds.cloudfront.net"]
  
}

variable "tomasafe_zone_id" {
  description = "The zone id of the tomasafe"
  type        = string
  default = "dsdsdsdsdsds"
  
}

variable "tomasafe_record_type" {
  description = "The record type of the tomasafe"
  type        = string
  default     = "CNAME"
}

variable "tomasafe_records" {
  description = "The records of the tomasafe"
  type        = list(string)
  default     = ["blalalal.cloudfront.net"]
  
}
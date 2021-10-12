variable "username" {
  type    = string
  default = "YOUR_USERNAME"
}

variable "password" {
  type    = string
  default = "YOUR_PASSWORD"
}

variable "hostname" {
  type    = string
  default = "YOUR_HOSTNAME"
}

variable "zone" {
  type    = string
  default = "YOUR_ZONE"
  #sg-sin1, "nl-ams1, de-fra1, uk-lon1, us-chi1 ... https://developers.upcloud.com/1.3/5-zones/
}

variable "plan" {
  type    = string
  default = "YOUR_PLAN"
  # 1xCPU-1GB, 1xCPU-2GB, 2xCPU-4GB, 4xCPU-8GB, 6xCPU-16GB, 8xCPU-32GB... https://github.com/v0112358/terraform-module-upcloud-server/tree/v1.0.0#server-plans
}

variable "osname" {
  type    = string
  default = "CentOS 7"
}

variable "diskzie" {
  type    = number
  default = DISK_SIZE
}

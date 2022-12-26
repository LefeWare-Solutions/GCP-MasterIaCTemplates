variable "network_name" {
  type  = string
}

variable "subnet_name" {
  type  = string
}

variable "service_account_id" {
  
}
variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

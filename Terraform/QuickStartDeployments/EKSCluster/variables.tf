variable "env_name"{
  type    =  string
}

variable "project_id" {
  type        = string
  description = "The Google Cloud Project Id"
}

variable "region" {
  type    = string
  default = "us-west1"
}
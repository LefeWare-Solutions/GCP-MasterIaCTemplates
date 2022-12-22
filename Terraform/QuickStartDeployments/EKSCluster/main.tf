terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket  = "lws-dev-common-bucket"
    prefix  = "global/networking.state"
    impersonate_service_account = "lws-d-iac-sa@lefewaresolutions-poc.iam.gserviceaccount.com"
  }

  required_version = ">= 0.14.9"
}

provider "google" {
  project = var.project_id
  region  = var.region
}


module "vpc" {
  source  = "../../Modules/VPC"

  project_id = var.project_id
  region     = "us-west1"
  vpc_name   = var.vpc_name
}
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "gcs" {
    bucket = "lws-dev-common-bucket"
    prefix    = "global/networking.state"
  }

  required_version = ">= 0.14.9"
}

provider "google" {
  project = "lefewaresolutions-poc"
  region  = "us-west1"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
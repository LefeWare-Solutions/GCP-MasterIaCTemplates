terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }

  backend "s3" {
    bucket = "s3-terraformstate"
    key    = "global/networking.state"
    region = "us-east-1"
  }

  required_version = ">= 0.14.9"
}

provider "google" {
  credentials = file("<NAME>.json")

  project = "<PROJECT_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
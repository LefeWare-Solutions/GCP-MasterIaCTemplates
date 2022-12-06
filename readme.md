# Introduction 
The following project contains Google Cloud Platform Infrasructure as Code (IaC) Templates in the following language:
1. Terraform


# Why Infrastructure as Code should always be used for deploying Cloud Infrastrcuture
At LefeWare Solutions, we strongly believe that IaC should ALWAYS be used for deploying infrastructure resources for the following reasons:
1. Avoid human error and redundancy
2. Automate infrastructure deployments
3. Easily reproduce deployments in multiple environments
4. IaC code is checked into source control and therefore can easily rollback or identify when an issue is introduced

---
# Which IAC language should I use?


## Terraform
terraform init
terraform plan -var-file="dev-variables.tfvars"
terraform apply -var-file="dev-variables.tfvars"

terraform apply -var-file="dev-variables.tfvars" -destroy

---
# Publishing Templates

---
# QucickStart Deployments


---
# Leveraging these Tempaltes from your Project
# locals.tf
locals {
  common_tags = {
    Project     = "Static-Website-cicd"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

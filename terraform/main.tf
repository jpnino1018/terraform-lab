locals {
  name_prefix = "${var.project_name}-${var.student_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Owner       = var.student_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "network" {
  source = "./modules/network"

  name_prefix        = local.name_prefix
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  allowed_ssh_cidr   = var.allowed_ssh_cidr
  common_tags        = local.common_tags
}
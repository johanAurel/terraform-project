module "vpc" {
  source ="./modules/vpc"
  private_subnets = var.private_subnets
  public_subnets = var.public
}
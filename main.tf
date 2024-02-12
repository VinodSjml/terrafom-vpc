module "vpc"{
    source             = "./vendor/modules/vpc"
    VPC_CIDR           = var.VPC_CIDR
    AZ                 = var.AZ
    ENV                = var.ENV
    PUBLIC_SUBNET_CIDR = var.PUBLIC_SUBNET_CIDR
    PRIVATE_SUBNET_CIDR = var.PRIVATE_SUBNET_CIDR 
    DEFAULT_VPC_ID     = var.DEFAULT_VPC_ID
    DEFAULT_VPC_CIDR   = var.DEFAULT_VPC_CIDR
}
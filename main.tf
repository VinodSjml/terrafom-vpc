module "vpc"{
    source = "/home/centos/terraform-vpc/vendor/modules/vpc"
    VPC_CIDR = var.VPC_CIDR
}
provider "aws"{
    region = var.region
}

# Pull available azs dynamically from aws for the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# Create aws vpc resource
resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr

    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = merge(
      var.tags, 
      {
        "Name" = var.vpc_name
      }
    )
}
# Create VPC Terraform Module
module "myvpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"  
  # version = "~> 2.78"

  # VPC Basic Details
  name = "Very-eu-s1-Dev"
  cidr = "10.85.140.0/23"   
  azs                 = ["eu-south-1a", "eu-south-1b"]
  private_subnets     = ["10.85.140.0/25", "10.85.140.128/25"]
  public_subnets      = ["10.85.141.0/25", "10.85.141.128/25"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets    = ["10.85.140.0/25", "10.85.140.128/25"]

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "Very-d-eu-s1a-app01"
  }

  private_subnet_tags = {
    Type = "Very-d-eu-s1a-data01"
  }

  database_subnet_tags = {
    Type = "Very-d-eu-s1a-data01"
  }

  tags = {
    Owner = "anand"
    Environment = "test"
  }

  vpc_tags = {
    Name = "Very-eu-s1-Dev"
  }
}




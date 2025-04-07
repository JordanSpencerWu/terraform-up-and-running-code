terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "example-bucket.terraform-state"
    key    = "example-bucket/prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "example-bucket.terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = var.cluster_name

  instance_type      = "t2.micro"
  max_size           = 10
  min_size           = 2
  enable_autoscaling = true

  custom_tags = {
    Environment = "production"
    Service     = "webserver"
    ManagedBy   = "terraform"
  }
}

# resource "aws_security_group_rule" "allow_testing_inbound" {
#   type              = "ingress"
#   security_group_id = module.webserver_cluster.alb_security_group_id

#   from_port   = 12345
#   to_port     = 12345
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }

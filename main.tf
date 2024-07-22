terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
 region = "us-east-1"
 profile = "bia"
}

resource "aws_instance" "bia-dev" {
    ami = "ami-02f3f602d23f1659d"
    instance_type = "t3.micro"

    tags = {
      ambient = "dev"
      name = "bia-dev"
    }

    vpc_security_group_ids = ["sg-0c6c5397047d8f8bd"]
    root_block_device {
      volume_size = 8
    }
}
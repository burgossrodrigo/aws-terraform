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

    vpc_security_group_ids = ["sg-09288094689da2e2c"]

    root_block_device {
      volume_size = 12
    }
}

resource "aws_security_group" "bia-dev" {
  name        = "bia-dev"
  description = "Acesso bia dev"
  vpc_id      = "vpc-0291fea3457442d47"

  ingress {
    description = "Liberado 3001 pra o mundo"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bia-dev"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
}

resource "aws_security_group" "mdb_traffic" {
  name   = "mdb_traffic"
  vpc_id = var.aws_vpc

  ingress {
    description = "Internal Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = "true"
  }

  ingress {
    description = "Remote Management"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MariaDB"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MaxScale GUI"
    from_port   = 8989
    to_port     = 8989
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mdb_traffic"
  }
}

resource "aws_instance" "mdb1" {
  ami               = var.aws_ami
  subnet_id         = var.aws_subnet
  availability_zone = var.aws_zone
  instance_type     = var.aws_mariadb_instance_size
  key_name          = var.key_pair_name
  root_block_device {
    volume_size = 100
  }
  user_data              = file("terraform_includes/create-user.sh")
  vpc_security_group_ids = [aws_security_group.mdb_traffic.id]
  tags = {
    Name = "mdb1"
  }
}

resource "aws_instance" "mdb2" {
  ami               = var.aws_ami
  subnet_id         = var.aws_subnet
  availability_zone = var.aws_zone
  instance_type     = var.aws_mariadb_instance_size
  key_name          = var.key_pair_name
  root_block_device {
    volume_size = 100
  }
  user_data              = file("terraform_includes/create-user.sh")
  vpc_security_group_ids = [aws_security_group.mdb_traffic.id]
  tags = {
    Name = "mdb2"
  }
}

resource "aws_instance" "mdb3" {
  ami               = var.aws_ami
  subnet_id         = var.aws_subnet
  availability_zone = var.aws_zone
  instance_type     = var.aws_mariadb_instance_size
  key_name          = var.key_pair_name
  root_block_device {
    volume_size = 100
  }
  user_data              = file("terraform_includes/create-user.sh")
  vpc_security_group_ids = [aws_security_group.mdb_traffic.id]
  tags = {
    Name = "mdb3"
  }
}

resource "aws_instance" "mx1" {
  ami                    = var.aws_ami
  subnet_id              = var.aws_subnet
  availability_zone      = var.aws_zone
  instance_type          = var.aws_maxscale_instance_size
  key_name               = var.key_pair_name
  user_data              = file("terraform_includes/create-user.sh")
  vpc_security_group_ids = [aws_security_group.mdb_traffic.id]
  tags = {
    Name = "mx1"
  }
}

resource "aws_instance" "mx2" {
  ami                    = var.aws_ami
  subnet_id              = var.aws_subnet
  availability_zone      = var.aws_zone
  instance_type          = var.aws_maxscale_instance_size
  key_name               = var.key_pair_name
  user_data              = file("terraform_includes/create-user.sh")
  vpc_security_group_ids = [aws_security_group.mdb_traffic.id]
  tags = {
    Name = "mx2"
  }
}


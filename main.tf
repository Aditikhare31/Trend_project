#create VPC 
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Trend_VPC"
  }
}

#define Internet Gateway
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Trend_gateway"
  }
}

#create public subnet 
resource "aws_subnet" "public_subnet" {
  vpc_id                          = aws_vpc.my_vpc.id
  cidr_block                      = "10.0.1.0/24"
  availability_zone               = "us-east-1a"
  map_public_ip_on_launch = true #means map the public ip to ec2 instance while launching in public subnet

  tags = {
    Name = "Trend_pub_subnet"
  }
}

#create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Trend_private_sub"
  }
}

#create route table
resource "aws_route_table" "my_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id 
  }

  tags = {
    Name = "Trend_route_table"
  }
}

#associate route table with public subnet
resource "aws_route_table_association" "sub_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route.id
  
}

resource "aws_security_group" "my_sg" {
  name    = "Trend_sg"
  vpc_id  = aws_vpc.my_vpc.id

#defining inbound port 22 for ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

#defining inbound port 3000 for ssh
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

#defining inbound port 8080 for jenkins
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

#defining inbound port 9100 for ssh
  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

#defining inbound port 9090 for ssh
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }        

#defining outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  #-1 is used to allow all protocols
    cidr_blocks = [ "0.0.0.0/0" ]
  }  
}

#create Ec2 instance
resource "aws_instance" "my_ec2" {
  ami                         = "ami-0b6c6ebed2801a5cb"
  instance_type               = "t3.small"
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = "trend-key" 
  associate_public_ip_address = true

  #defining userdata for installing jenkins
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y fontconfig openjdk-21-jre
              java -version
              sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
              https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
              echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
              https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
              /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt update -y
              sudo apt install -y jenkins
              EOF

  tags = {
    Name = "TrendProject"
  }
}

#create IAM user
resource "aws_iam_user" "user" {
  name = "trend_user"

  tags = {
    Name = "TrendUser"
  }
}

#attaching IAM policy
resource "aws_iam_user_policy_attachment" "access" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


data "aws_ami" "linuxAmi" {
  most_recent = true
  owners      = ["self", "amazon"]

  filter {
    name   = "name"
    values = var.amiNanme
  }
}

data "aws_subnet" "selected"{
    # filter {
    #   name = "tags:Name"
    #   values = [nexon-sebnet-web1]     #not recommanded
    # }
    id = "subnet-0d17391fe9f11fe10"     #Recommanded, beacus id is unique for subnet
}

resource "aws_instance" "nexon_ec2-web" {
    ami = data.aws_ami.linuxAmi.id
    instance_type = var.machinetype
    key_name = "nexon-linux-key"
    subnet_id = data.aws_subnet.selected.id

    tags = {
        Name = "nexon-ec2-web"
    }
}
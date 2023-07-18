variable "ingress" {
    description = "ingress ports"
    type = list(map(any))
    default = [{port1=80,port2=22,port3=443,port4=53}]
}

#variable "ingress" {
#    description = "ingress ports"
#    type = list(map(any))
#    default = {[port1=80,port2=22,port3=443,port4=53]}
#}

resource "aws_security_group" "awsfw" {
    name = "aws-fw"
    vpc_id = aws_vpc.tfvpc.id
    dynamic "ingress" {
      for_each = toset([80,53,443,22,21])
      content {
        protocol = "tcp"
        to_port = awsfw.value.key
      }
    }
}
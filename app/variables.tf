variable env { 
    description = "Environment of app"
    type = string
}

variable hash_key {
    description = "Hash Key of dynamoDB"
    type = string
}

variable cnt { 
    description = "count of EC2 instances"
    type = number
}

variable ec2_ami {
    description = "AMI for EC2 instance"
    type = string
}

variable ec2_instance_type {
    description = "Instance Type for EC2 instance"
    type = string
}
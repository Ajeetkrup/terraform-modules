module dev_infra {
    source = "./app"

    env = "dev"
    hash_key = "userId"
    cnt = 1
    ec2_ami = "ami-09e6f87a47903347c"
    ec2_instance_type = "t2.micro"
}

module prod_infra {
    source = "./app"

    env = "prod"
    hash_key = "userId"
    cnt = 2
    ec2_ami = "ami-09e6f87a47903347c"
    ec2_instance_type = "t2.medium"
}

module stg_infra {
    source = "./app"

    env = "stg"
    hash_key = "userId"
    cnt = 1
    ec2_ami = "ami-09e6f87a47903347c"
    ec2_instance_type = "t2.micro"
}
module "network_us_west_1" {
    source = "../"
    region = "us-west-1"
    vpc_cidr_block = "10.0.0.0/16"
    tags = {
        region = "us-west-1"
    }
}

module "network_us_west_2" {
    source = "../"
    region = "us-west-2"
    vpc_cidr_block = "10.0.0.0/16"
    tags = {
        region = "us-west-2"
    }
}
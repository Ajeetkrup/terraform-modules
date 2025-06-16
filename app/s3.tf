resource aws_s3_bucket state_bucket {
    bucket = "${var.env}-terra-tut-state-buck"

    tags = {
        Name = "${var.env}-terra-tut-state-buck",
        Environment = var.env
    }
}
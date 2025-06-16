resource "aws_dynamodb_table" "terra_state_table" {
  name           = "${var.env}-terraform-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name        = "${var.env}-terraform-state-table"
    Environment = var.env
  }
}
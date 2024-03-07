
resource "aws_dynamodb_table" "johans_table" {
  count = 2
  name             = var.table[count.index]
  hash_key         = var.key
  billing_mode     = "PAY_PER_REQUEST"
 attribute {
    name = var.key
    type = "N"
  }

}
output "table_id" {
  value = aws_dynamodb_table.johans_table[*].id
}
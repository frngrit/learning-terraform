resource "aws_dynamodb_table" "test-frank-table" {
  count            = 1
  name             = "test-frank-table"
  billing_mode     = "PROVISIONED"
  hash_key         = "UserId"
  range_key        = "UpdatedOn"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  write_capacity   = 1
  lifecycle {
    prevent_destroy = true
  }

  point_in_time_recovery {
    enabled = true
  }

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "UpdatedOn"
    type = "S"
  }

}

resource "aws_dynamodb_table" "test-frank-table" {
  count            = 1
  name             = "test-frank-table"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "#Uuid"
  range_key        = "UpdatedOn"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  lifecycle {
    prevent_destroy = true
  }

  point_in_time_recovery {
    enabled = true
  }

  attribute {
    name = "#Uuid"
    type = "S"
  }

  attribute {
    name = "UpdatedOn"
    type = "S"
  }

}

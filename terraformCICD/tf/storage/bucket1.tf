resource "google_storage_bucket" "my_bucket" {

  for_each = toset([ "test1","test2","test3"])
  
  name          = "lhz-bucket-dev-ducy-${each.value}"
  location      = "${var.region}"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
  force_destroy = true
}

resource "google_storage_bucket" "my_bucket2" {
  
  name          = "lhz-bucket-dev-ducy-hello2"
  location      = "${var.region}"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
  force_destroy = true
}
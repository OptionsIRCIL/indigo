variable "IMAGE_NAME" {
  type = string
  default = "ghcr.io/optionsircil/indigo"
  description = "Container name"
}

variable "IMAGE_TAGS" {
  type = list(string)
  default = ["latest"]
  description = "Tags for built container"
}

target "default" {
  target = "dist"
  tags = formatlist("%s:%s", IMAGE_NAME, IMAGE_TAGS)
  attest = [
    "type=provenance,mode=max",
    "type=sbom",
  ]
  platforms = ["local"]
  output = ["type=oci,dest=build/image.tar"]
  cache_to = [{
    "mode": "max",
    "type": "gha"
  }]
  cache_from = [{
    "type": "gha"
  }]
}

target "openapi_spec" {
  target = "dist_openapi_spec"
  output = ["build"]
  platforms = ["local"]
  cache_to = [{
    "mode": "max",
    "type": "gha"
  }]
  cache_from = [{
    "type": "gha"
  }]
}

# docker-bake.hcl
variable "REPOSITORY_PREFIX" { default = "" }
variable "VERSION" { default = "7.1.0" }

group "default" {
  targets = [
    "registrator",
  ]
}

target "registrator" {
  args = {
    VERSION = "${VERSION}",
  }
  labels = {
    "org.opencontainers.image.title" = "Registrator",
    "org.opencontainers.image.source" = "https://github.com/iManageDave/registrator/",
    "org.opencontainers.image.version" = "${VERSION}",
  }
  tags = [
    "${REPOSITORY_PREFIX}registrator:${VERSION}",
    "${REPOSITORY_PREFIX}registrator:latest",
  ]
  target = "registrator"
}

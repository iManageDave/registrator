# docker-bake.hcl
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
    "imanagedave/registrator:${VERSION}",
    "imanagedave/registrator:latest",
  ]
  target = "registrator"
}

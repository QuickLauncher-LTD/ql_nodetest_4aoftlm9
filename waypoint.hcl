project = "nodetest_4aoftlm9"

app "nodetest_4aoftlm9" {
  build {
    use "pack" {
      builder     = "heroku/buildpacks:20"
    }
    registry {
      use "docker" {
        image = var.ecr_repo
        tag   = var.image_tag
      }
    }
  }
  deploy {
    use "docker" {
    }
  }
}

variable "image_tag" {
  type    = string
}

variable "ecr_repo" {
  type    = string
}


job nodetest_4aoftlm9 {

  datacenters = ["dc-quicklauncher"]

  group "quick-launcher" {
    count = 1
    network {
      mode = "bridge"
      port "http" {
        static = 22741
        to = 5000
      }
    }

    service {
      name = replace("nodetest_4aoftlm9", "_", "-")
      port = "http"

      check {
        type     = "http"
        path     = "/"
        interval = "2s"
        timeout  = "2s"
      }
    }

    task "server" {
      driver = "docker"

     resources {
       cpu    = 250
       memory = 500
     }

      config {
        image = var.image
        ports = ["http"]
      }
    }
  }
}

variable "image" {
    type = string
}


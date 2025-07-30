mod "kubernetes_image_inventory" {
  title         = "Kubernetes Image Inventory"
  description   = ""
  color         = "#960019"
  documentation = file("./README.md")
  categories = ["kubernetes", "images", "dashboard", "inventory"]
  require {
    plugin "kubernetes" {
      min_version = "1.4.0"
    }
  }
}


dashboard "pod_images" {
  title = "All Pod Images"
  table {
    title = "Pod Images"
    width = 12
    query = query.pod_container_images
  }
}

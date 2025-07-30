
dashboard "search_pod_images" {

  title = "Search Pod Images"

  input "image_search_text" {
    title = "Search images"
    // query = query.vp_namespace_input
    width = 4
    type = "text"
  }

  table {
    title = "Deployment"
    width = 12
    query = query.search_pod_container_images
    args = {
      image_search_text = self.input.image_search_text.value
    }
  }
  
}


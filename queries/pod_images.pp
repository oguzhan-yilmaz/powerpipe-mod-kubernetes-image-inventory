
query "pod_container_images" {
  sql = <<-EOQ
    SELECT 
        context_name,
        namespace,
        name as pod_name,
        container_info->>'name' as container_name,
        container_info->>'image' as image,
        container_info->>'imagePullPolicy' as image_pull_policy
    FROM kubernetes_pod,
        jsonb_array_elements(containers::jsonb) as container_info
    ORDER BY context_name, namespace, pod_name;
  EOQ
}


# Create an arbitrary local resource
# data "ibm_container_cluster" "cluster" {
#   cluster_name_id = "myclusterNishu"
# }

# provider "kubernetes" {
#   host                   = data.ibm_container_cluster_config.cluster_foo.host
# }

data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars = {
    sample_var = var.sample_var
  }
}

# This is just to make sure that ibm provider is instantiated
# /* data "ibm_schematics_workspace" "test" {
#   workspace_id = "my-workspace-id"
# }
# */

resource "null_resource" "sleep" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}

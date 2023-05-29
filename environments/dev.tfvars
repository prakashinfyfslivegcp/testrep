######### compute engine ###########
vpc_name          = "terraform-test"
image_family      = "ubuntu-2004-lts"
image_project     = "ubuntu-os-cloud"
subnetwork_name   = "subnet-vm"
region            = "us-east1"
instance_name     = "gcp-terraform-test-vm"
instance_type     = "f1-micro"
instance_zone     = "us-east1-b"
public_ip_name    = "test-instance-pip"

########### common parameters ########
common_tags = {
  app          = "test"
  client       = "hsbc"
  createdUsing = "tf"
}

########## managed instance group ###########

instance_template_name_prefix   = "test-web-instance-template"
machine_type                    = "f1-micro"
boot_disk_size_gb               = 128
boot_disk_auto_delete           = true
boot_disk_type                  = "pd-standard"
instance_group_manager_name     = "web-instance-group-manager"
base_instance_name              = "web-instance"
target_size                     = 2
mig_zone                        = "us-east1-b"
update_policy_type              = "PROACTIVE"
minimal_action                  = "REPLACE"
max_surge_percent               = 20
max_unavailable_fixed           = 1
service_port                    = 80
mig_name                        = "test-mig"
disk_type                       = "PERSISTENT"
service_port_name               = "http-service-port"
target_pool_session_affinity    = "NONE"
hc_request_path                 = "/"
min_num_replicas                = "2"
max_num_replicas                = "5"
cool_down_period_sec            = "60"
target_cpu_utilization          = "0.7"
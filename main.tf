# Configure the Alicloud Provider
provider "alicloud" {
  access_key = "LTAI5tMgbUHhWa4hMSDSZPLG"
  secret_key = "DpSXjq93VfcTv59b1PN2b3SDhkXFS2"
  region     = "us-east-1"
}

# Create a Instance
resource "alicloud_instance" "instancia-proyecto" {
  image_id             = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  internet_charge_type = "PayByBandwidth"
  instance_type        = "ecs.n1.tiny"
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
  vswitch_id           = "vsw-0xiben10xjy2rp0mcebkh"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id      = "vpc-0xitqce3r9llzjd6y4obq"
}
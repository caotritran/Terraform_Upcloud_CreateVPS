resource "random_string" "random" {
  length  = 12
  special = false
}

resource "upcloud_server" "newvps" {
  hostname = var.hostname
  zone     = var.zone
  plan     = var.plan

  template {
    storage = var.osname
    size    = var.diskzie
  }

  network_interface {
    type = "public"
  }

  login {
    user            = "root"
    #create_password = true
    #password_delivery = "none"
    keys = [
      file("/opt/terraform/id_rsa.pub")
    ]
  }

  provisioner "remote-exec" {
     inline = [
        "sed -i '/^PasswordAuthentication/s/^.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config",
        "echo ${random_string.random.id} | passwd --stdin root",
        "systemctl restart sshd"
     ]
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("/opt/terraform/id_rsa")
      host        = self.network_interface[0].ip_address
    }
  }

#  provisioner "local-exec" {
#    command = <<EOF
#echo "deploy_user ansible_host=`terraform output -raw publicIP` ansible_ssh_pass=\"`terraform output -raw password`\" ansible_user=root ansible_port=22" > ./ansible_adduser/iplist.txt \
#&& ansible-playbook -i ./ansible_adduser/iplist.txt ./ansible_adduser/main.yml
#EOF
#  }
}
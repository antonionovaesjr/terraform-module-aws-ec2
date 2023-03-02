resource "aws_instance" "server" {
  ami                         = var.instance_os_list[var.instance_os]
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  # user_data = !var.install_nginx ? "" : <<EOF
  #   #!/bin/bash
  #   sudo apt update -y
  #   sudo apt install nginx -y
  #   EOF

  user_data = var.user_data_file_path == "none" ? "" : "${file(var.user_data_file_path)}"

  tags = {
    Name        = var.name
    Environment = var.enviroment
    OS          = var.instance_os
    Managed     = "IAC"
  }
}
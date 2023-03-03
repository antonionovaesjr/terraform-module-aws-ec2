variable "volume_size" {
  description = "tamanho do espaço em disco"
  type    = number
  default = 10
}

variable "public_ip" {
  type    = bool
  default = false
}

variable "install_nginx" {
  type    = bool
  default = false
}

variable "enviroment" {
  type    = string
  default = "none"
}

variable "subnet_id" {
  type = string
}

variable "name" {
  type    = string
  default = "no_name"
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_os" {
  type = string
}

variable "instance_os_list" {
  type = map(any)
  default = {
    ubuntu  = "ami-00eeedc4036573771"
    windows = "ami-0dc21fb273a648e34"
  }
}

variable "user_data_file_path" {
  description = "file that contain commands on start and create ec2"
  type = string
  default = "none"
}

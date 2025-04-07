# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
}

# OPTIONAL PARAMETERS
# These parameters have reasonable defaults. 
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

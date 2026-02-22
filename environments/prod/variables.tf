variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "East US"
}
variable "resource_group" {
  type = string
  default = "rg-project-delta-prod"
}
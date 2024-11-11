variable "email" {
    description = "Email address for budget notifications"
    type        = string
}

variable "tags" {
    description = "Tags to apply to all resources"
    type        = map(string)
    default     = {
        nombre = "terraform"
        iac    = "terraform"
        env    = "Automatización y despliegue"
    }
}
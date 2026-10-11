variable "compute_region_autoscalers" {
  description = <<EOT
Map of compute_region_autoscalers, attributes below
Required:
    - name
    - target
    - autoscaling_policy (block):
        - cooldown_period (optional)
        - cpu_utilization (optional, block):
            - predictive_method (optional)
            - target (required)
        - load_balancing_utilization (optional, block):
            - target (required)
        - max_replicas (required)
        - metric (optional, block):
            - filter (optional)
            - name (required)
            - single_instance_assignment (optional)
            - target (optional)
            - type (optional)
        - min_replicas (required)
        - mode (optional)
        - scale_in_control (optional, block):
            - max_scaled_in_replicas (optional, block):
                - fixed (optional)
                - percent (optional)
            - time_window_sec (optional)
        - scaling_schedules (optional, block):
            - description (optional)
            - disabled (optional)
            - duration_sec (required)
            - min_required_replicas (required)
            - name (required)
            - schedule (required)
            - time_zone (optional)
        - stabilization_period (optional)
Optional:
    - deletion_policy
    - description
    - project
    - region
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    target          = string
    deletion_policy = optional(string)
    description     = optional(string)
    project         = optional(string)
    region          = optional(string)
    autoscaling_policy = object({
      cooldown_period = optional(number)
      cpu_utilization = optional(object({
        predictive_method = optional(string)
        target            = number
      }))
      load_balancing_utilization = optional(object({
        target = number
      }))
      max_replicas = number
      metric = optional(list(object({
        filter                     = optional(string)
        name                       = string
        single_instance_assignment = optional(number)
        target                     = optional(number)
        type                       = optional(string)
      })))
      min_replicas = number
      mode         = optional(string)
      scale_in_control = optional(object({
        max_scaled_in_replicas = optional(object({
          fixed   = optional(number)
          percent = optional(number)
        }))
        time_window_sec = optional(number)
      }))
      scaling_schedules = optional(list(object({
        description           = optional(string)
        disabled              = optional(bool)
        duration_sec          = number
        min_required_replicas = number
        name                  = string
        schedule              = string
        time_zone             = optional(string)
      })))
      stabilization_period = optional(number)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


resource "google_compute_region_autoscaler" "compute_region_autoscalers" {
  for_each = var.compute_region_autoscalers

  name            = each.value.name
  target          = each.value.target
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  project         = each.value.project
  region          = each.value.region

  autoscaling_policy {
    cooldown_period = each.value.autoscaling_policy.cooldown_period
    dynamic "cpu_utilization" {
      for_each = each.value.autoscaling_policy.cpu_utilization != null ? [each.value.autoscaling_policy.cpu_utilization] : []
      content {
        predictive_method = cpu_utilization.value.predictive_method
        target            = cpu_utilization.value.target
      }
    }
    dynamic "load_balancing_utilization" {
      for_each = each.value.autoscaling_policy.load_balancing_utilization != null ? [each.value.autoscaling_policy.load_balancing_utilization] : []
      content {
        target = load_balancing_utilization.value.target
      }
    }
    max_replicas = each.value.autoscaling_policy.max_replicas
    dynamic "metric" {
      for_each = each.value.autoscaling_policy.metric != null ? each.value.autoscaling_policy.metric : []
      content {
        filter                     = metric.value.filter
        name                       = metric.value.name
        single_instance_assignment = metric.value.single_instance_assignment
        target                     = metric.value.target
        type                       = metric.value.type
      }
    }
    min_replicas = each.value.autoscaling_policy.min_replicas
    mode         = each.value.autoscaling_policy.mode
    dynamic "scale_in_control" {
      for_each = each.value.autoscaling_policy.scale_in_control != null ? [each.value.autoscaling_policy.scale_in_control] : []
      content {
        dynamic "max_scaled_in_replicas" {
          for_each = scale_in_control.value.max_scaled_in_replicas != null ? [scale_in_control.value.max_scaled_in_replicas] : []
          content {
            fixed   = max_scaled_in_replicas.value.fixed
            percent = max_scaled_in_replicas.value.percent
          }
        }
        time_window_sec = scale_in_control.value.time_window_sec
      }
    }
    dynamic "scaling_schedules" {
      for_each = each.value.autoscaling_policy.scaling_schedules != null ? each.value.autoscaling_policy.scaling_schedules : []
      content {
        description           = scaling_schedules.value.description
        disabled              = scaling_schedules.value.disabled
        duration_sec          = scaling_schedules.value.duration_sec
        min_required_replicas = scaling_schedules.value.min_required_replicas
        name                  = scaling_schedules.value.name
        schedule              = scaling_schedules.value.schedule
        time_zone             = scaling_schedules.value.time_zone
      }
    }
    stabilization_period = each.value.autoscaling_policy.stabilization_period
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


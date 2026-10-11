output "compute_region_autoscalers_id" {
  description = "Map of id values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no id are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "compute_region_autoscalers_autoscaling_policy" {
  description = "Map of autoscaling_policy values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no autoscaling_policy are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => one(v.autoscaling_policy) if v.autoscaling_policy != null && length(v.autoscaling_policy) > 0 }
}
output "compute_region_autoscalers_creation_timestamp" {
  description = "Map of creation_timestamp values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no creation_timestamp are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.creation_timestamp if v.creation_timestamp != null && length(v.creation_timestamp) > 0 }
}
output "compute_region_autoscalers_deletion_policy" {
  description = "Map of deletion_policy values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no deletion_policy are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "compute_region_autoscalers_description" {
  description = "Map of description values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no description are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "compute_region_autoscalers_name" {
  description = "Map of name values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no name are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "compute_region_autoscalers_project" {
  description = "Map of project values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no project are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.project if v.project != null && length(v.project) > 0 }
}
output "compute_region_autoscalers_region" {
  description = "Map of region values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no region are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.region if v.region != null && length(v.region) > 0 }
}
output "compute_region_autoscalers_self_link" {
  description = "Map of self_link values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no self_link are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.self_link if v.self_link != null && length(v.self_link) > 0 }
}
output "compute_region_autoscalers_target" {
  description = "Map of target values across all compute_region_autoscalers, keyed the same as var.compute_region_autoscalers except keys with no target are omitted"
  value       = { for k, v in google_compute_region_autoscaler.compute_region_autoscalers : k => v.target if v.target != null && length(v.target) > 0 }
}


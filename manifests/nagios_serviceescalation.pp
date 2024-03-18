# Wrapper around nagios_serviceescalation
define safer_nagios::nagios_serviceescalation (
  $nagios_title,
  $ensure                       = undef,
  $contact_groups               = undef,
  $contacts                     = undef,
  $escalation_options           = undef,
  $escalation_period            = undef,
  $first_notification           = undef,
  $host_name                    = undef,
  $hostgroup_name               = undef,
  $last_notification            = undef,
  $notification_interval        = undef,
  $provider                     = undef,
  $register                     = undef,
  $service_description          = undef,
  $servicegroup_name            = undef,
  $target                       = undef,
  $use                          = undef,

  $area                         = undef, # Folder name
  $group                        = undef, # File name
) {

  $_target = safer_nagios::nagios_base($target, $area, $group)

  if ! defined(Nagios_serviceescalation[$nagios_title]) {
    nagios_serviceescalation { $nagios_title:
      ensure                => $ensure,
      contact_groups        => $contact_groups,
      contacts              => $contacts,
      escalation_options    => $escalation_options,
      escalation_period     => $escalation_period,
      first_notification    => $first_notification,
      host_name             => $host_name,
      hostgroup_name        => $hostgroup_name,
      last_notification     => $last_notification,
      notification_interval => $notification_interval,
      provider              => $provider,
      register              => $register,
      service_description   => $service_description,
      servicegroup_name     => $servicegroup_name,
      target                => $_target,
      use                   => $use,
    }
  }
}

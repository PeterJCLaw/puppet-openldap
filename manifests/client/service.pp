# Class: ldap::client::service
#
# This module manages LDAP Client service management
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class ldap::client::service(
) {

  # TODO: Need to add a translation between passed 'ensure' to this service
  # state

  service { 'nscd':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  # XXX jmorse
  if $::operatingsystem == 'Fedora' and versioncmp($::operatingsystemrelease, '20') >= 0 {
    service { 'nslcd':
      ensure     => 'running',
      enable     => true,
    }
  }
}

# == Class: stigs::rules::srg_os_000215
#
# Full description of class site here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { site:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class stigs::rules::srg_os_000215 ( ) {

  # Linux users
  if $::kernel == 'Linux' {

    class{'rsyslog::client':
      log_local      => true,
      log_auth_local => true,
      remote_servers => [
        {
          host     => 'urxmonitor.resource.jwac.ic.gov',
          port     => '514',
          protocol => 'udp',
          #format    => 'RFC3164fmt',
        },
      ]
    }

  }

}

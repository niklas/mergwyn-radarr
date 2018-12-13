# Class: radarr
# ===========================
#
# Full description of class radarr here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * package_manage
# * service_manage
# * service_enable
# * user
# * group
#
# Examples
# --------
#
# @example
#    class { 'radarr':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class radarr (
  Boolean $package_manage = true,
  Boolean $service_manage = true,
  Boolean $service_active = true,
  Boolean $service_enable = true,
  String  $user           = 'radarr',
  String  $group          = 'radarr',
  String  $install_path   = '/opt',
  Optional[Integer[1,10]] $keep = 1,
  ) {

  contain radarr::config
  contain radarr::install
  contain radarr::service

  Class['::radarr::install']
  -> Class['::radarr::config']
  ~> Class['::radarr::service']

}
# vim: nu tabstop=8 expandtab shiftwidth=2 softtabstop=2
